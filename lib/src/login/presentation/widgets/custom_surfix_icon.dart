import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class CustomSurffixIcon extends StatelessWidget {
  const CustomSurffixIcon({
    Key? key,
    required this.svgIcon,
  }) : super(key: key);

  final String svgIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        0,
        MediaQuery.of(context).size.width * 0.05,
        MediaQuery.of(context).size.width * 0.05,
        MediaQuery.of(context).size.width * 0.05,
      ),
      child: SvgPicture.asset(
        svgIcon,
        height: MediaQuery.of(context).size.width * 0.06,
      ),
    );
  }
}
