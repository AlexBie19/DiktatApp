import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => TextButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 14, 28, 54),
          foregroundColor: const  Color.fromARGB(255, 249, 251, 242),
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
        ),
        onPressed: onClicked,
        child: Text(text),

      );
}
