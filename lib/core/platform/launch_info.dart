import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:home_x_client/core/errors/failures.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class LaunchInfo {
  /// Open url in web browser
  Future<Either<Failure, bool>> launchUrl(String url);
}

class LaunchInfoImpl implements LaunchInfo {
  @override
  Future<Either<Failure, bool>> launchUrl(String urlString) async {
    try {
      launch(urlString, forceSafariVC: false, forceWebView: false);
      return Right(true);
    } on PlatformException {
      return Left(Failure(
          "Device Error!🔔.\nYour device doesn't support this action."));
    }
  }
}
