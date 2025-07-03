import 'package:flutter/material.dart';
import 'package:slip/constants/colors.dart';
import 'package:slip/views/login_view/widgets/app_title_section.dart';
import 'package:slip/views/login_view/widgets/login_section.dart';


class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: redColor,
      body: Column(children: [AppTittleSection(), LoginSection()]),
    );
  }
}









