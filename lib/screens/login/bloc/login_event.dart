part of 'login_bloc.dart';

abstract class LoginScreenEvent {}

class UpdateTimeEvent extends LoginScreenEvent {
  final DateTime currentTime;
  UpdateTimeEvent({required this.currentTime});
}

class EnterPasswordEvent extends LoginScreenEvent {
  final List<String> enteredPassword;
  EnterPasswordEvent(this.enteredPassword);
}

class ConfirmLoginEvent extends LoginScreenEvent {
  final List<String> enteredPassword;
  ConfirmLoginEvent(this.enteredPassword);
}
