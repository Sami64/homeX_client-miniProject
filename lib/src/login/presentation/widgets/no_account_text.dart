import 'package:flutter/material.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
     Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don’t have an account? ",
          style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.05),
        ),
        GestureDetector(
          onTap: () => Navigator.of(context).pushNamed('/signup'),
          child: Text(
            "Sign Up",
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.05,
                color: Theme.of(context).primaryColor),
          ),
        ),
      ],
    );
  }
}
