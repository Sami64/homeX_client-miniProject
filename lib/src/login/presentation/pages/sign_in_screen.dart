import 'package:flutter/material.dart';
import 'package:home_x_client/injection_container.dart';
import 'package:home_x_client/src/login/presentation/bloc/login_bloc.dart';

import '../widgets/body.dart';

class SignInScreen extends StatelessWidget {
  final _bloc = sl<LoginBloc>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(bloc: _bloc),
    );
  }
}
