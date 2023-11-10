import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/components.dart';
import '../components/my_colors.dart';
import '../components/my_strings.dart';
import '../components/my_text_style.dart';
import '../controller/main_screen_controller.dart';

class MainScreen extends StatelessWidget {
  MainScreen({
    super.key,
  });

  final MainScreenController mainScreenController = Get.put(
    MainScreenController(),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          20,
          0,
          20,
          0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                    () => Text(
                      "ورزش سه - ${mainScreenController.appBarTitle.value}",
                      style: MyTextStyle.appBarTitle,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      mainScreenController.getNewsAllSports();
                      mainScreenController.appBarTitle.value =
                          MyStrings.allSports;
                    },
                    child: const Icon(Icons.refresh, color: MyColors.appTitle),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    mainScreenController.getNewsAllSports();
                    mainScreenController.appBarTitle.value =
                        MyStrings.allSports;
                  },
                  child: const Text(
                    MyStrings.allSports,
                    style: MyTextStyle.hashTag,
                  ),
                ),
                const Text(" - ", style: MyTextStyle.dash),
                InkWell(
                  onTap: () {
                    mainScreenController.getNewsInsideFootball();
                    mainScreenController.appBarTitle.value =
                        MyStrings.insideFootball;
                  },
                  child: const Text(
                    MyStrings.insideFootball,
                    style: MyTextStyle.hashTag,
                  ),
                ),
                const Text(" - ", style: MyTextStyle.dash),
                InkWell(
                  onTap: () {
                    mainScreenController.getNewsOutSideFootball();
                    mainScreenController.appBarTitle.value =
                        MyStrings.outFootball;
                  },
                  child: const Text(
                    MyStrings.outFootball,
                    style: MyTextStyle.hashTag,
                  ),
                ),
                const Text(" - ", style: MyTextStyle.dash),
                InkWell(
                  onTap: () {
                    mainScreenController.getNewsOtherSports();
                    mainScreenController.appBarTitle.value =
                        MyStrings.otherSport;
                  },
                  child: const Text(
                    MyStrings.otherSport,
                    style: MyTextStyle.hashTag,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Obx(
              () => mainScreenController.loading.value != false
                  ? Expanded(child: myLoading())
                  : Expanded(
                      child: RefreshIndicator(
                        color: Colors.black,
                        onRefresh: () async {
                          // await Future.delayed(
                          //   const Duration(seconds: 1),
                          // ).then(
                          //   (value) {
                          //     return mainScreenController.getNewsAllSports();
                          //   },
                          // );
                          await mainScreenController.getNewsAllSports();
                        },
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: mainScreenController.rssList.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(20),
                                      // margin:
                                      //     const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                      decoration: BoxDecoration(
                                        color: MyColors.box,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            mainScreenController
                                                .rssList[index].title,
                                            style: MyTextStyle.title,
                                            textAlign: TextAlign.justify,
                                          ),
                                          SizedBox(height: Get.height / 80),
                                          Text(
                                            mainScreenController
                                                .rssList[index].description,
                                            style: MyTextStyle.description,
                                            textAlign: TextAlign.justify,
                                          ),
                                          SizedBox(height: Get.height / 50),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "${mainScreenController.rssList[index].pubDate}",
                                                style: MyTextStyle.pubDate,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  myLunchUrl(
                                                    mainScreenController
                                                        .rssList[index].link!,
                                                  );
                                                },
                                                child: const Text(
                                                  "ادامه مطلب",
                                                  style: MyTextStyle.readMore,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      width: double.infinity,
                                      height: 3,
                                      decoration: const BoxDecoration(
                                        color: MyColors.topBox,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: Get.height / 40),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
