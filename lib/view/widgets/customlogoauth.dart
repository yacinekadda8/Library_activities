import 'package:flutter/material.dart';
import '../../const.dart';

class CustomLogoAuth extends StatelessWidget {
  const CustomLogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          alignment: Alignment.center,
          width: 80,
          height: 80,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: AppColors.secondaryColor,
              borderRadius: BorderRadius.circular(70)),
          child: Image.asset(
            "assets/images/logo.png",
            height: 40,
            // fit: BoxFit.fill,
          )),
    );
  }
}
