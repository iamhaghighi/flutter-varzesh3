import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:url_launcher/url_launcher.dart';

import 'my_colors.dart';

Future<void> myLunchUrl(String url) async {
  var uri = Uri.parse(url);
  if (!await launchUrl(uri)) {
    throw Exception('Could not launch $uri');
  }
}

Widget myLoading() {
  return const SpinKitThreeBounce(
    color: MyColors.loading,
    size: 15,
  );
}
