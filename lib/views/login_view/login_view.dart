import 'package:flutter/material.dart';
import 'package:slip/constants/colors.dart';
import 'package:slip/views/login_view/widgets/app_title_section.dart';
import 'package:slip/views/login_view/widgets/login_section.dart';


class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: redColor,
        body: SingleChildScrollView(child: Column(children: [AppTittleSection(), LoginSection()])),
      ),
    );
  }
}
