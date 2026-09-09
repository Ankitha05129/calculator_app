import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  String display = '0';
  double firstNumber = 0;
  String operator = '';

  void press(String value) {
    setState(() {
      if ('0123456789'.contains(value)) {
        display = display == '0' ? value : display + value;
      } else if ('+-×÷'.contains(value)) {
        firstNumber = double.parse(display);
        operator = value;
        display = '0';
      } else if (value == '=') {
        double secondNumber = double.parse(display);

        if (operator == '+') display = '${firstNumber + secondNumber}';
        if (operator == '-') display = '${firstNumber - secondNumber}';
        if (operator == '×') display = '${firstNumber * secondNumber}';
        if (operator == '÷') display = '${firstNumber / secondNumber}';
      } else if (value == 'C') {
        display = '0';
        firstNumber = 0;
        operator = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Calculator')),
        body: Column(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    display,
                    style: const TextStyle(fontSize: 50),
                  ),
                ),
              ),
            ),
            Row(children: ['7', '8', '9', '÷'].map(button).toList()),
            Row(children: ['4', '5', '6', '×'].map(button).toList()),
            Row(children: ['1', '2', '3', '-'].map(button).toList()),
            Row(children: ['C', '0', '=', '+'].map(button).toList()),
          ],
        ),
      ),
    );
  }

  Widget button(String text) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: ElevatedButton(
          onPressed: () => press(text),
          child: Text(text, style: const TextStyle(fontSize: 25)),
        ),
      ),
    );
  }
}