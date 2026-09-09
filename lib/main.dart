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

  void pressNumber(String number) {
    setState(() {
      display = display == '0' ? number : display + number;
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
                  child: Text(display,
                      style: const TextStyle(fontSize: 50)),
                ),
              ),
            ),
            Row(children: [
              button('7'), button('8'), button('9'), button('÷'),
            ]),
            Row(children: [
              button('4'), button('5'), button('6'), button('×'),
            ]),
            Row(children: [
              button('1'), button('2'), button('3'), button('-'),
            ]),
            Row(children: [
              button('C'), button('0'), button('='), button('+'),
            ]),
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
          onPressed: () {
            if (text.length == 1 && '0123456789'.contains(text)) {
              pressNumber(text);
            }
          },
          child: Text(text, style: const TextStyle(fontSize: 25)),
        ),
      ),
    );
  }
}