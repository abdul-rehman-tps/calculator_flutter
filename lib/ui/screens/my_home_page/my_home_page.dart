import 'package:calculator_flutter/ui/widgets/my_button.dart';
import 'package:calculator_flutter/util/util.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _expression = '';
  bool evaluated = false;

  void onTap(String buttonText) {
    if (buttonText == 'AC') {
      _expression = '';
    } else if (buttonText == '=') {
      try {
        Parser p = Parser();
        String parsableExpression = toParsableExpression(_expression);
        Expression exp = p.parse(parsableExpression);
        ContextModel cm = ContextModel();
        _expression =
            removeDecimalZeroFormat(exp.evaluate(EvaluationType.REAL, cm));
        evaluated = true;
      } catch (e) {
        if (kDebugMode) print('Error: $e');
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
            _expression.split(RegExp(r'[+\-×/%]')).last; // Get the last operand
        if (!lastOperand.contains('.')) {
          // Append the decimal point only if the last operand does not have one
          _expression += buttonText;
        }
      } else {
        // Append the decimal point if the expression does not contain any operator
        if (!_expression.contains('.')) _expression += buttonText;
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
        evaluated = false;
      }
    } else if (buttonText == '00' || buttonText == '0') {
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
        // Append Zeros if the expression does not end with an operator
        _expression += buttonText;
      }
    } else {
      if (evaluated) {
        _expression = buttonText;
        evaluated = false;
      } else {
        _expression += buttonText;
      }
    }
    setState(() {});
  }

  String toParsableExpression(String displayedExpression) {
    return displayedExpression.replaceAll('×', '*');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  reverse: true,
                  child: Text(
                    _expression,
                    textAlign: TextAlign.end,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyButton(
                    buttonText: 'AC',
                    textColor: Colors.grey,
                    onPressed: () => onTap('AC'),
                  ),
                  MyButton(
                    buttonText: '+/-',
                    textColor: Colors.grey,
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
                    textColor: Colors.grey,
                    onPressed: () => onTap('%'),
                  ),
                  MyButton(
                    buttonText: '/',
                    textColor: Colors.orange,
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
                    buttonText: '×',
                    textColor: Colors.orange,
                    onPressed: () => onTap('×'),
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
                    textColor: Colors.orange,
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
                    textColor: Colors.orange,
                    onPressed: () => onTap('+'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: ((MediaQuery.of(context).size.width - 16) / 2) - 16,
                    child: ElevatedButton(
                      onPressed: () => onTap('0'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(16.0),
                      ),
                      child: Expanded(
                        child: Text(
                          '0',
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontSize: 28,
                                  ),
                        ),
                      ),
                    ),
                  ),
                  MyButton(
                    buttonText: '.',
                    onPressed: () => onTap('.'),
                  ),
                  MyButton(
                    buttonText: '=',
                    textColor: Colors.orange,
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
