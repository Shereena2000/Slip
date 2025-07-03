import 'package:flutter/material.dart';
import 'package:slip/constants/colors.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Login",
      style: TextStyle(
        color: blackColor,
        fontWeight: FontWeight.w500,
        fontSize: 24,
      ),
    );
  }
}