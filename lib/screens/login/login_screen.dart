// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:test_project/constants.dart';
import 'package:test_project/screens/login/bloc/login_bloc.dart';
import 'package:test_project/screens/login/components/login_body.dart';
import 'package:test_project/screens/login/login_controller.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kAppBarColor,
        shadowColor: Colors.black.withOpacity(0.3),
        title: const Text(
          'Log In',
          style: kAppBarTextStyle,
        ),
      ),
      body: BlocProvider(
        create: (context) => LoginScreenBloc(),
        child: LoginBody(),
      ),
    );
  }
}
