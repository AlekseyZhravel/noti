// ignore_for_file: use_key_in_widget_constructors, deprecated_member_use

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:test_project/screens/login/bloc/login_bloc.dart';
import 'package:test_project/screens/login/login_screen_constant.dart';
import 'package:test_project/shared_widgets/custom_button.dart';
import 'package:test_project/constants.dart';
import 'package:test_project/shared_widgets/otp_form_widget.dart';

class LoginBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LoginScreenBloc bloc = BlocProvider.of<LoginScreenBloc>(context);

    Timer timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      bloc.add(UpdateTimeEvent(currentTime: DateTime.now()));
    });

    bool errorStatus = true;
    bool isActiveButton = false;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 72.0,
        ),
        const Text(
          'Log In',
          style: kTitleTextStyle,
        ),
        const SizedBox(
          height: 16.0,
        ),
        const Text(
          'Enter current time in hh : mm format',
          style: kDescriptionTextStyle,
        ),
        const SizedBox(
          height: 42.0,
        ),
        BlocBuilder<LoginScreenBloc, LoginScreenState>(
          builder: (context, state) {
            if (state is CurrentTimeState) {
              return Text(
                DateFormat.Hm().format(state.currentTime),
                style: kLoginTimeTextStyle,
              );
            }

            return Text(
              DateFormat.Hm().format(DateTime.now()),
              style: kLoginTimeTextStyle,
            );
          },
        ),
        const SizedBox(
          height: 42.0,
        ),
        OtpFormWidget(
          onChanged: (otpValue) {
            bloc.add(ErrorEvent(otpValue));
          },
        ),
        const Spacer(),
        SafeArea(
          child: Column(
            children: [
              BlocBuilder<LoginScreenBloc, LoginScreenState>(
                builder: (context, state) {
                  if (state is ErrorState) {
                    errorStatus = state.errorStatus;
                    print(errorStatus);
                  }
                  return Visibility(
                    visible: !errorStatus,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                      width: double.infinity,
                      color: kDividerColor2,
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/error_icon.svg',
                            color: kRedColor,
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          const Text(
                            'The time is wrong. Try again.',
                            style: kErrorTextStyle,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 32.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: BlocBuilder<LoginScreenBloc, LoginScreenState>(
                  builder: (context, state) {
                    if (state is ButtonState) {
                      isActiveButton = state.isConfirmLogin;
                    }

                    return CustomButton(
                      text: 'Confirm',
                      onPressed: () {
                        // login();
                        timer.cancel();
                      },
                      isActive: isActiveButton,
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
            ],
          ),
        )
      ],
    );
  }
}
