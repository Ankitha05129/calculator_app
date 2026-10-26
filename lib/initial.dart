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
      home: Scaffold(
        appBar: AppBar(title: const Text('Calculator')),
        body: Column(
          children: [
            const Expanded(
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text('0', style: TextStyle(fontSize: 50)),
                ),
              ),
            ),

            Row(
              children: [
                button('7'), button('8'), button('9'), button('÷'),
              ],
            ),
            Row(
              children: [
                button('4'), button('5'), button('6'), button('×'),
              ],
            ),
            Row(
              children: [
                button('1'), button('2'), button('3'), button('-'),
              ],
            ),
            Row(
              children: [
                button('C'), button('0'), button('='), button('+'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static Widget button(String text) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: ElevatedButton(
          onPressed: () {},
          child: Text(text, style: const TextStyle(fontSize: 25)),
        ),
      ),
    );
  }
}