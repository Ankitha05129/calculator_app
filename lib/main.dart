
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
  bool newNumber = false;

  void buttonPressed(String button) {
    setState(() {
      if (button == 'C') {
        display = '0';
        firstNumber = 0;
        operator = '';
        newNumber = false;
      } else if (button == '⌫') {
        if (display.length > 1) {
          display = display.substring(0, display.length - 1);
        } else {
          display = '0';
        }
      } else if ('0123456789'.contains(button)) {
        if (display == '0' || newNumber) {
          display = button;
          newNumber = false;
        } else {
          display += button;
        }
      } else if ('+-*/'.contains(button)) {
        firstNumber = double.parse(display);
        operator = button;
        newNumber = true;
      } else if (button == '=') {
        if (operator.isEmpty) return;

        double secondNumber = double.parse(display);
        double result = 0;

        switch (operator) {
          case '+':
            result = firstNumber + secondNumber;
            break;
          case '-':
            result = firstNumber - secondNumber;
            break;
          case '*':
            result = firstNumber * secondNumber;
            break;
          case '/':
            if (secondNumber == 0) {
              display = 'Cannot divide by zero';
              operator = '';
              newNumber = true;
              return;
            }
            result = firstNumber / secondNumber;
            break;
        }

        display = result == result.toInt()
            ? result.toInt().toString()
            : result.toString();

        newNumber = true;
        operator = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: Scaffold(
        backgroundColor: Colors.deepPurple.shade50,
        appBar: AppBar(
          title: const Text(
            'Calculator',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.bottomRight,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      display,
                      style: const TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                flex: 4,
                child: Column(
                  children: [
                    for (final row in [
                      ['7', '8', '9', '/'],
                      ['4', '5', '6', '*'],
                      ['1', '2', '3', '-'],
                      ['C', '0', '⌫', '+'],
                      ['='],
                    ])
                      Expanded(
                        child: Row(
                          children: [
                            for (final button in row)
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      buttonPressed(button);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          button == 'C' ||
                                                  button == '⌫'
                                              ? Colors.red.shade100
                                              : '+-*/='.contains(button)
                                                  ? Colors.deepPurple
                                                  : Colors.white,
                                      foregroundColor:
                                          '+-*/='.contains(button)
                                              ? Colors.white
                                              : Colors.deepPurple,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15),
                                      ),
                                      minimumSize: const Size(
                                        double.infinity,
                                        double.infinity,
                                      ),
                                      textStyle: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    child: Text(button),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
