import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:varzesh3_abstract/components/my_colors.dart';

Future<void> myLunchUrl(String url) async {
  var uri = Uri.parse(url);
  if (!await launchUrl(uri)) {
    throw Exception('Could not launch $uri');
  }
}


Widget myLoading() {
  return const SpinKitThreeBounce (
    color: MyColors.loading,
    size: 15,
  );
}


// PreferredSize appBar({required String titleBar}) {
//   return PreferredSize(
//     preferredSize: const Size.fromHeight(80),
//     child: Padding(
//       padding: const EdgeInsets.fromLTRB(28, 20, 22, 20),
//       child: AppBar(
//         actions: [
//           Center(
//             child: Text(
//               titleBar,
//               style: MyTextStyle.topTitle,
//             ),
//           )
//         ],
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: Container(
//           decoration: const BoxDecoration(
//             color: Colors.purple,
//             shape: BoxShape.circle,
//           ),
//           child: GestureDetector(
//             onTap: () {
//               // Get.find<ArticleScreenController>().articleList.clear();
//               // Get.find<ArticleScreenController>().getNewArticle();
//               // Get.back();
//             },
//             child: const Icon(
//               Icons.keyboard_arrow_right,
//               color: Colors.white,
//             ),
//           ),
//         ),
//       ),
//     ),
//   );
// }