import 'package:flutter/material.dart';
import 'package:home_x_client/injection_container.dart';
import 'package:home_x_client/src/sign_up/presentation/bloc/sign_up_bloc.dart';
import 'package:home_x_client/src/sign_up/presentation/widgets/body.dart';

class SignUpScreen extends StatelessWidget {
  final _bloc = sl<SignupBloc>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
        bloc: _bloc,
      ),
    );
  }
}
