import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slip/bloc/login/login_cubit.dart';
import 'package:slip/bloc/login/login_state.dart';
import 'package:slip/constants/spacing.dart';
import 'package:slip/views/login_view/widgets/login_header.dart';
import 'package:slip/views/login_view/widgets/login_sub_title.dart';
import 'package:slip/views/login_view/widgets/phone_number_input_feild.dart';
import 'package:slip/views/login_view/widgets/signin_button.dart';
import 'package:slip/views/sales_view/sales_view.dart';

class LoginSection extends StatelessWidget {
  final TextEditingController _mobileController = TextEditingController();
  LoginSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
        child: BlocConsumer<LoginCubit, LoginState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LoginHeader(),
                hSpace10,
                LoginSubTitle(),
                PhoneNumberInputFeild(mobileController: _mobileController),
                hSpace15,
                state.when(
                  loading:
                      () => const Center(child: CircularProgressIndicator()),
                  initial:
                      () => SignInButton(
                        onPressed: () {
                          context.read<LoginCubit>().login(
                            _mobileController.text,
                          );
                        },
                      ),
                  success:
                      (_) => SignInButton(
                        onPressed: () {
                          context.read<LoginCubit>().login(
                            _mobileController.text,
                          );
                        },
                      ),
                  error:
                      (_) => SignInButton(
                        onPressed: () {
                          context.read<LoginCubit>().login(
                            _mobileController.text,
                          );
                        },
                      ),
                ),
              ],
            );
          },
          listener: (context, state) {
            state.when(
              initial: () {},
              loading: () {},
              success: (data) {
                // Navigate to sales view on successful login
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SalesView()),
                );
              },
              error: (message) {
                // Show error message
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(message), backgroundColor: Colors.red),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
