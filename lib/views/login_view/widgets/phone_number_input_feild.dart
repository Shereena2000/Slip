import 'package:flutter/material.dart';
import 'package:slip/constants/colors.dart';

class PhoneNumberInputFeild extends StatelessWidget {
  const PhoneNumberInputFeild({
    super.key,
    required TextEditingController mobileController,
  }) : _mobileController = mobileController;

  final TextEditingController _mobileController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _mobileController,
      keyboardType: TextInputType.phone,
      style: TextStyle(
        // 👈 this controls user-typed text
        fontSize: 20,
        color: blackColor,
        fontWeight: FontWeight.w500,
        letterSpacing: 1,
      ),
      decoration: InputDecoration(
        hintText: 'XXXXXXXXXX',
        hintStyle: TextStyle(
          fontSize: 20,
          color: blackColor,
          fontWeight: FontWeight.w500,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: lightGreyColor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: lightGreyColor),
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/Flag_of_India.png', // Make sure this asset exists
                width: 25,
                height: 25,
              ),
              const SizedBox(width: 8),
              const Text(
                '91',
                style: TextStyle(
                  fontSize: 20,
                  color: blackColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
      ),
    );
  }
}