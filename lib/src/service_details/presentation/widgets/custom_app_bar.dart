import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends PreferredSize {
  final double rating;

  CustomAppBar({required this.rating})
      : super(preferredSize: Size(2, 2), child: Text(''));

  @override
  // AppBar().preferredSize.height provide us the height that appy on our app bar
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Row(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width * 0.1,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60),
                ),
                color: Colors.white,
                padding: EdgeInsets.zero,
                onPressed: () => Navigator.pop(context),
                child: SvgPicture.asset(
                  "assets/icons/Back_Icon.svg",
                  height: 15,
                ),
              ),
            ),
            Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  Text(
                    "$rating",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 5),
                  SvgPicture.asset("assets/icons/Star_Icon.svg"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
