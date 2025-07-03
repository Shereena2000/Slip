
import 'package:flutter/material.dart';
import 'package:slip/constants/colors.dart';

class LoginSubTitle extends StatelessWidget {
  const LoginSubTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("Enter Your Mobile number", style: TextStyle(color: greyColor));
  }
}