
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

  void buttonPressed(String button) {
    setState(() {
      if ('0123456789'.contains(button)) {
        if (display == '0') {
          display = button;
        } else {
          display += button;
        }
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
        appBar: AppBar(
          title: const Text('Calculator'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    display,
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    for (final row in [
                      ['7', '8', '9', '/'],
                      ['4', '5', '6', '*'],
                      ['1', '2', '3', '-'],
                      ['0', '+'],
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
                                      minimumSize: const Size(
                                        double.infinity,
                                        double.infinity,
                                      ),
                                      textStyle: const TextStyle(
                                        fontSize: 24,
                                      ),
                                    ),
                                    child: Text(button),
                                  ),
                                ),
                              ),
                            if (row.length == 2)
                              const Spacer(flex: 2),
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
