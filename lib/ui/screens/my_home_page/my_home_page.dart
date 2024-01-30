import 'package:calculator_flutter/ui/widgets/my_button.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _result = 0;

  String? value;

  String? operation;

  void applyOperation() {
    if (value == null || operation == null) return;
    double value2 = double.tryParse(value!) ?? 0;
    switch (operation) {
      case '+':
        _result += value2;
        break;
      case '-':
        _result -= value2;
        break;
      case 'x':
        _result *= value2;
        break;
      case '/':
        _result -= value2;
        break;
      case '%':
        _result = _result / 100;
        break;
    }

    setState(() {
      value = null;
      operation = null;
      _result = _result;
    });
  }

  void clear() {
    setState(() {
      value = null;
      operation = null;
      _result = 0;
    });
  }

  void onDigitTap(String digit) {
    if (value == null || digit == '0') return;
    if (value == null) {
      value = digit;
    } else {
      value = '$value$digit';
    }
    setState(() => value = value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Calculator'),
      ),
      body: Padding(
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
                        _result.toString(),
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        operation ?? value ?? '',
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
                  onPressed: clear,
                ),
                MyButton(
                  buttonText: '+/-',
                  onPressed: () => {},
                ),
                MyButton(
                  buttonText: '%',
                  onPressed: () => {},
                ),
                MyButton(
                  buttonText: '/',
                  onPressed: () => {},
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyButton(
                  buttonText: '7',
                  onPressed: () => onDigitTap('7'),
                ),
                MyButton(
                  buttonText: '8',
                  onPressed: () => onDigitTap('8'),
                ),
                MyButton(
                  buttonText: '9',
                  onPressed: () => onDigitTap('9'),
                ),
                MyButton(
                  buttonText: 'x',
                  onPressed: () => {},
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyButton(
                  buttonText: '4',
                  onPressed: () => onDigitTap('4'),
                ),
                MyButton(
                  buttonText: '5',
                  onPressed: () => onDigitTap('5'),
                ),
                MyButton(
                  buttonText: '6',
                  onPressed: () => onDigitTap('6'),
                ),
                MyButton(
                  buttonText: '-',
                  onPressed: () => {},
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyButton(
                  buttonText: '1',
                  onPressed: () => onDigitTap('1'),
                ),
                MyButton(
                  buttonText: '2',
                  onPressed: () => onDigitTap('2'),
                ),
                MyButton(
                  buttonText: '3',
                  onPressed: () => onDigitTap('3'),
                ),
                MyButton(
                  buttonText: '+',
                  onPressed: () => {},
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyButton(
                  buttonText: '0',
                  onPressed: () => onDigitTap('0'),
                ),
                MyButton(
                  buttonText: '.',
                  onPressed: () => {},
                ),
                MyButton(
                  buttonText: '=',
                  onPressed: () => {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
