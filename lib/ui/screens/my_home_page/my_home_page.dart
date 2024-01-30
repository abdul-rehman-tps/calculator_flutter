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
                  onPressed: clear,
                ),
                MyButton(
                  buttonText: '8',
                  onPressed: () => {},
                ),
                MyButton(
                  buttonText: '9',
                  onPressed: () => {},
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
                  onPressed: clear,
                ),
                MyButton(
                  buttonText: '5',
                  onPressed: () => {},
                ),
                MyButton(
                  buttonText: '6',
                  onPressed: () => {},
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
                  onPressed: clear,
                ),
                MyButton(
                  buttonText: '2',
                  onPressed: () => {},
                ),
                MyButton(
                  buttonText: '3',
                  onPressed: () => {},
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
                  onPressed: clear,
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
