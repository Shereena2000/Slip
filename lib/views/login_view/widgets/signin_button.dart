import 'package:flutter/material.dart';
import 'package:slip/constants/colors.dart';

class SignInButton extends StatelessWidget {
  final VoidCallback onPressed;
  const SignInButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 3, top: 3, bottom: 3),
        decoration: BoxDecoration(
          color: Colors.teal,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Sign in',
              style: TextStyle(
                fontSize: 16,
                color: whiteColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 20),
            CircleAvatar(
              radius: 13,
              backgroundColor: Colors.teal[700], // Darker shade for contrast
              child: const Icon(
                Icons.arrow_forward_ios,
                size: 13,
                color: Colors.white,
                weight: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
