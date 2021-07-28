import 'package:flutter/material.dart';
import 'no_account_text.dart';
import 'sign_form.dart';

class Body extends StatelessWidget {
  final bloc;

  const Body({Key? key, required this.bloc}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.06),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                Text(
                  "Welcome Back",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.width * 0.06,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Sign in with your email and password",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                SignForm(
                  bloc: bloc,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                NoAccountText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
