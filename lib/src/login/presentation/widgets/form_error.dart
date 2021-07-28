import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class FormError extends StatelessWidget {
  const FormError({
    Key? key,
    required this.errors,
  }) : super(key: key);

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          errors.length, (index) => formErrorText(error: errors[index], context:context)),
    );
  }

  Row formErrorText({required String error, required BuildContext context}) {
    return Row(
      children: [
        SvgPicture.asset(
          "assets/icons/Error.svg",
          height: MediaQuery.of(context).size.width * 0.04,
          width:  MediaQuery.of(context).size.width * 0.04,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.03,
        ),
        Text(error),
      ],
    );
  }
}
