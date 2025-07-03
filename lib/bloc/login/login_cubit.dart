import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slip/services/api_service.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState.initial());

  Future<void> login(String mobile) async {
    if (mobile.isEmpty) {
      emit(const LoginState.error('Please enter mobile number'));
      return;
    }

    if (mobile.length != 10) {
      emit(const LoginState.error('Please enter valid 10-digit mobile number'));
      return;
    }

    emit(const LoginState.loading());

    try {
      // Using hardcoded MPIN as mentioned in your requirement
      const String mpin = '0000';
      
      final result = await ApiService.login(mobile, mpin);

      if (result['success']) {
        emit(LoginState.success(result['data']));
      } else {
        emit(LoginState.error(result['error']));
      }
    } catch (e) {
      emit(LoginState.error('An unexpected error occurred: $e'));
    }
  }

  void reset() {
    emit(const LoginState.initial());
  }
}