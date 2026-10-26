import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String display = "0";
  double firstNumber = 0;
  String operator = "";

  void buttonPressed(String value) {
    setState(() {
      if (value == "+" || value == "-" || value == "*" || value == "/") {
        firstNumber = double.parse(display);
        operator = value;
        display = "0";
      } else if (value == "=") {
        double secondNumber = double.parse(display);
        double result = 0;

        if (operator == "+") {
          result = firstNumber + secondNumber;
        } else if (operator == "-") {
          result = firstNumber - secondNumber;
        } else if (operator == "*") {
          result = firstNumber * secondNumber;
        } else if (operator == "/") {
          if (secondNumber != 0) {
            result = firstNumber / secondNumber;
          }
        }

        display = result.toString();
        operator = "";
      } else {
        if (display == "0") {
          display = value;
        } else {
          display += value;
        }
      }
    });
  }

  Widget button(String text) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: ElevatedButton(
          onPressed: () => buttonPressed(text),
          child: Text(
            text,
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  display,
                  style: const TextStyle(fontSize: 40),
                ),
              ),
            ),
          ),

          Row(
            children: [
              button("7"),
              button("8"),
              button("9"),
              button("/"),
            ],
          ),

          Row(
            children: [
              button("4"),
              button("5"),
              button("6"),
              button("*"),
            ],
          ),

          Row(
            children: [
              button("1"),
              button("2"),
              button("3"),
              button("-"),
            ],
          ),

          Row(
            children: [
              button("0"),
              button("."),
              button("="),
              button("+"),
            ],
          ),
        ],
      ),
    );
  }
}