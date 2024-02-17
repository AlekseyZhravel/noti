part of 'login_bloc.dart';

abstract class LoginScreenEvent {}

class UpdateTimeEvent extends LoginScreenEvent {
  final DateTime currentTime;
  UpdateTimeEvent({required this.currentTime});
}

class ErrorEvent extends LoginScreenEvent {
  final List<String> enteredPassword;
  ErrorEvent(this.enteredPassword);
}

class ButtonEvent extends LoginScreenEvent {
  final List<String> enteredPassword;
  ButtonEvent(this.enteredPassword);
}
