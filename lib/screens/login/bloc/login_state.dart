part of 'login_bloc.dart';

abstract class LoginScreenState {}

class CurrentTimeState extends LoginScreenState {
  final DateTime currentTime;
  CurrentTimeState(this.currentTime);
}

class PasswordState extends LoginScreenState {
  final bool isPasswordTrue;
  PasswordState(this.isPasswordTrue);
}

class ConfirmButtonState extends LoginScreenState {
  final bool isConfirmLogin;
  ConfirmButtonState(this.isConfirmLogin);
}
