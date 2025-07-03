import 'package:flutter/material.dart';
import 'package:slip/constants/colors.dart';

class AppTittleSection extends StatelessWidget {
  const AppTittleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        child: Center(
          child: Text(
            "Slip",
            style: TextStyle(
              color: whiteColor,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
