import 'package:flutter/material.dart';
import 'package:home_x_client/src/sign_up/presentation/bloc/sign_up_bloc.dart';

import 'sign_up_form.dart';

class Body extends StatelessWidget {
  final SignupBloc bloc;

  const Body({Key? key, required this.bloc}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.08),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04), // 4%
                Text("Register Account", style: TextStyle()),
                Text(
                  "Complete your details",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                SignUpForm(bloc: bloc,),
                SizedBox(height: MediaQuery.of(context).size.height * 0.08),

                SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                Text(
                  'By continuing your confirm that you agree \nwith our Term and Condition',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.caption,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
