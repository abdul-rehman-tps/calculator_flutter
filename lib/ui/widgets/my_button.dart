import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final Color? textColor;

  const MyButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double width = ((screenWidth - 16) / 4) - 16;

    return SizedBox(
      width: width,
      height: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(16.0),
        ),
        child: Text(
          buttonText,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: 28,
                color: textColor,
              ),
        ),
      ),
    );
  }
}
