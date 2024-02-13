import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginScreenBloc extends Bloc<LoginScreenEvent, LoginScreenState> {
  LoginScreenBloc() : super(CurrentTimeState(DateTime.now())) {
    on<UpdateTimeEvent>(_currentTimeEvent);
    on<EnterPasswordEvent>(_enteringPasswordEvent);
    on<ConfirmLoginEvent>(_confirmLoginEvent);
  }

  _currentTimeEvent(UpdateTimeEvent event, Emitter<LoginScreenState> emit) {
    // print(event.currentTime);
    emit(CurrentTimeState(event.currentTime));
  }

  _enteringPasswordEvent(
      EnterPasswordEvent event, Emitter<LoginScreenState> emit) {
    final List<String> otp = event.enteredPassword;
    if ('${otp[0]}${otp[1]}:${otp[2]}${otp[3]}' ==
            DateFormat.Hm().format(DateTime.now()) ||
        otp.join('').isEmpty) {
      emit(PasswordState(true));
    } else {
      emit(PasswordState(false));
    }
  }

  _confirmLoginEvent(ConfirmLoginEvent event, Emitter<LoginScreenState> emit) {
    // Сделать чтобі кнопка тоже меняла стиль
  }

  String get getCurrentTime {
    final DateTime now = DateTime.now();
    return DateFormat.Hm().format(now);
  }
}
