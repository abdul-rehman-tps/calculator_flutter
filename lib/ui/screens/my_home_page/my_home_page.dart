import 'package:calculator_flutter/ui/widgets/my_button.dart';
import 'package:calculator_flutter/util/util.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _result = 0;

  String _expression = '';

  void onTap(String buttonText) {
    if (buttonText == 'AC') {
      _expression = '';
    } else if (buttonText == '=') {
      try {
        Parser p = Parser();
        Expression exp = p.parse(_expression);
        ContextModel cm = ContextModel();
        _result = exp.evaluate(EvaluationType.REAL, cm);
        _expression = '';
      } catch (e) {
        _expression = 'Error';
      }
    } else if (buttonText == '.') {
      if (_expression.isEmpty || _expression.endsWith('.')) {
        // Do nothing if the expression is empty or already ends with a decimal point
      } else if (_expression.contains('+') ||
          _expression.contains('-') ||
          _expression.contains('×') ||
          _expression.contains('/') ||
          _expression.contains('%')) {
        // Check if the expression contains any operator
        String lastOperand =
            _expression.split(RegExp(r'[+\-×/]')).last; // Get the last operand
        if (!lastOperand.contains('.')) {
          // Append the decimal point only if the last operand does not have one
          _expression += buttonText;
        }
      } else {
        // Append the decimal point if the expression does not contain any operator
        _expression += buttonText;
      }
    } else if (buttonText == '+' ||
        buttonText == '-' ||
        buttonText == '×' ||
        buttonText == '/' ||
        buttonText == '%') {
      // Check if the button is an operator
      if (_expression.isEmpty) {
        // Do nothing if the expression is empty
      } else if (_expression.endsWith('+') ||
          _expression.endsWith('-') ||
          _expression.endsWith('×') ||
          _expression.endsWith('/') ||
          _expression.endsWith('%')) {
        // Replace the last operator with the new one if the expression already ends with an operator
        _expression =
            _expression.substring(0, _expression.length - 1) + buttonText;
      } else {
        // Append the operator if the expression does not end with an operator
        _expression += buttonText;
      }
    } else if (buttonText == '00') {
      // Check if the button is '00'
      if (_expression.isEmpty) {
        // Do nothing if the expression is empty
      } else if (_expression.endsWith('+') ||
          _expression.endsWith('-') ||
          _expression.endsWith('×') ||
          _expression.endsWith('/') ||
          _expression.endsWith('%')) {
        // Do nothing if the expression ends with an operator
      } else {
        // Append '00' if the expression does not end with an operator
        _expression += buttonText;
      }
    } else {
      _expression += buttonText;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          removeDecimalZeroFormat(_result),
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          _expression,
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyButton(
                    buttonText: 'AC',
                    onPressed: () => onTap('AC'),
                  ),
                  MyButton(
                    buttonText: '+/-',
                    onPressed: () {
                      if (_expression.endsWith('+')) {
                        onTap('-');
                      } else {
                        onTap('+');
                      }
                    },
                  ),
                  MyButton(
                    buttonText: '%',
                    onPressed: () => onTap('%'),
                  ),
                  MyButton(
                    buttonText: '/',
                    onPressed: () => onTap('/'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyButton(
                    buttonText: '7',
                    onPressed: () => onTap('7'),
                  ),
                  MyButton(
                    buttonText: '8',
                    onPressed: () => onTap('8'),
                  ),
                  MyButton(
                    buttonText: '9',
                    onPressed: () => onTap('9'),
                  ),
                  MyButton(
                    buttonText: 'x',
                    onPressed: () => onTap('x'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyButton(
                    buttonText: '4',
                    onPressed: () => onTap('4'),
                  ),
                  MyButton(
                    buttonText: '5',
                    onPressed: () => onTap('5'),
                  ),
                  MyButton(
                    buttonText: '6',
                    onPressed: () => onTap('6'),
                  ),
                  MyButton(
                    buttonText: '-',
                    onPressed: () => onTap('-'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyButton(
                    buttonText: '1',
                    onPressed: () => onTap('1'),
                  ),
                  MyButton(
                    buttonText: '2',
                    onPressed: () => onTap('2'),
                  ),
                  MyButton(
                    buttonText: '3',
                    onPressed: () => onTap('3'),
                  ),
                  MyButton(
                    buttonText: '+',
                    onPressed: () => onTap('+'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyButton(
                    buttonText: '0',
                    onPressed: () => onTap('0'),
                  ),
                  MyButton(
                    buttonText: '00',
                    onPressed: () => onTap('00'),
                  ),
                  MyButton(
                    buttonText: '.',
                    onPressed: () => onTap('.'),
                  ),
                  MyButton(
                    buttonText: '=',
                    onPressed: () => onTap('='),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
