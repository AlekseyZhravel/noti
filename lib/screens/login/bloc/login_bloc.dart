import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginScreenBloc extends Bloc<LoginScreenEvent, LoginScreenState> {
  LoginScreenBloc() : super(CurrentTimeState(DateTime.now())) {
    on<UpdateTimeEvent>(_currentTimeEvent);
    on<ErrorEvent>(_errorStatusEvent);
    on<ButtonEvent>(_buttonStatusEvent);
  }

  _currentTimeEvent(UpdateTimeEvent event, Emitter<LoginScreenState> emit) {
    // print(event.currentTime);
    emit(CurrentTimeState(event.currentTime));
  }

  _errorStatusEvent(ErrorEvent event, Emitter<LoginScreenState> emit) {
    final List<String> otp = event.enteredPassword;
    if (otp.join('').length == 4 &&
        '${otp[0]}${otp[1]}:${otp[2]}${otp[3]}' !=
            DateFormat.Hm().format(DateTime.now())) {
      emit(ErrorState(false));
    } else {
      emit(ErrorState(true));
    }
  }

  _buttonStatusEvent(ButtonEvent event, Emitter<LoginScreenState> emit) {
    final List<String> otp = event.enteredPassword;
    if ('${otp[0]}${otp[1]}:${otp[2]}${otp[3]}' ==
            DateFormat.Hm().format(DateTime.now())) {
      emit(ButtonState(true));
    } else {
      emit(ButtonState(false));
    }
  }
}
