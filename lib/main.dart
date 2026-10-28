
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
                child: Column(
  mainAxisAlignment: MainAxisAlignment.end,
  crossAxisAlignment: CrossAxisAlignment.end,
  children: const [
    Text(
      '0',
      style: TextStyle(
        fontSize: 24,
        color: Colors.grey,
      ),
    ),
    SizedBox(height: 8),
    Text(
      '0',
      style: TextStyle(
        fontSize: 48,
        fontWeight: FontWeight.bold,
      ),
    ),
  ],
),
                ),
              
              Expanded(
                flex: 3,
                child: Center(
                  child: Text(
                    'Calculator buttons will appear here',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
