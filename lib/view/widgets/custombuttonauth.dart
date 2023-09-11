import 'package:flutter/material.dart';
class CustomButtonAuth extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  final Color? color;
  const CustomButtonAuth({
    super.key,
    this.onPressed,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 40,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: color,
      textColor: Colors.white,
      onPressed: onPressed,
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }
}
