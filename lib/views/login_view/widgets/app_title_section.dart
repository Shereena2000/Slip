import 'package:flutter/material.dart';
import 'package:slip/constants/colors.dart';

class AppTittleSection extends StatelessWidget {
  const AppTittleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
          height: MediaQuery.of(context).size.height * 0.25,
      child: Center(
        child: Text(
          "Slip",
          style: TextStyle(
            color: whiteColor,
            fontSize: 45,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
