part of 'login_bloc.dart';

abstract class LoginScreenState {}

class CurrentTimeState extends LoginScreenState {
  final DateTime currentTime;
  CurrentTimeState(this.currentTime);
}

class ErrorState extends LoginScreenState {
  final bool errorStatus;
  ErrorState(this.errorStatus);
}

class ButtonState extends LoginScreenState {
  final bool isConfirmLogin;
  ButtonState(this.isConfirmLogin);
}
