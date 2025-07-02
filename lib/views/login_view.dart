import 'package:flutter/material.dart';
import 'package:slip/constants/colors.dart';
import 'package:slip/views/sales_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _mobileController = TextEditingController();
    return Scaffold(
      backgroundColor: redColor,
      body: Column(
        children: [
          Expanded(
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
          ),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.75,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Login",
                    style: TextStyle(
                      color: blackColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Enter Your Mobile number",
                    style: TextStyle(color: greyColor),
                  ),
                  TextFormField(
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
                      prefixIconConstraints: BoxConstraints(
                        minWidth: 0,
                        minHeight: 0,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                 GestureDetector(
  onTap: () {
    // Handle sign in action
    Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => const SalesView()),
);
  },
  child: Container(
    padding: const EdgeInsets.only(left: 10,right: 3,top: 3,bottom: 3),
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
            color:whiteColor,
            fontWeight: FontWeight.w500
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
)


                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
