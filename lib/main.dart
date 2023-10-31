// TODO: Fixed AppBarr

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:varzesh3_abstract/components/my_components.dart';
import 'package:varzesh3_abstract/components/my_strings.dart';
import 'package:varzesh3_abstract/components/my_text_style.dart';
import 'package:varzesh3_abstract/controller/main_screen_controller.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final MainScreenController mainScreenController = Get.put(
    MainScreenController(),
  );

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: const Locale('fa', 'IR'),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(166, 44, 44, 44),
        body: mainScreen(),
      ),
    );
  }

  Widget mainScreen() {
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
                    () => Text(mainScreenController.topTitle.value,
                        style: MyTextStyle.topTitle),
                  ),
                  InkWell(
                    onTap: () {
                      mainScreenController.getNewsOutSide();
                      mainScreenController.topTitle.value =
                          MyStrings.outFootball;
                    },
                    child: const Icon(Icons.refresh, color: Colors.white),
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
                    mainScreenController.topTitle.value = MyStrings.allSports;
                  },
                  child: const Text(
                    MyStrings.allSports,
                    style: MyTextStyle.subTitle,
                  ),
                ),
                const Text(" - ", style: MyTextStyle.dash),
                InkWell(
                  onTap: () {
                    mainScreenController.getNewsInside();
                    mainScreenController.topTitle.value =
                        MyStrings.insideFootball;
                  },
                  child: const Text(
                    MyStrings.insideFootball,
                    style: MyTextStyle.subTitle,
                  ),
                ),
                const Text(" - ", style: MyTextStyle.dash),
                InkWell(
                  onTap: () {
                    mainScreenController.getNewsOutSide();
                    mainScreenController.topTitle.value = MyStrings.outFootball;
                  },
                  child: const Text(
                    MyStrings.outFootball,
                    style: MyTextStyle.subTitle,
                  ),
                ),
                const Text(" - ", style: MyTextStyle.dash),
                InkWell(
                  onTap: () {
                    mainScreenController.getNewsOtherSports();
                    mainScreenController.topTitle.value = MyStrings.otherSport;
                  },
                  child: const Text(
                    MyStrings.otherSport,
                    style: MyTextStyle.subTitle,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Text(
            //   MyStrings.defaultTopTitle,
            //   style: const TextStyle(
            //     color: Colors.white,
            //     fontFamily: "dana",
            //   ),
            // ),
            // const SizedBox(height: 20),
            Obx(
              () => mainScreenController.loading.value != false
                  ? Expanded(child: myLoading())
                  : Expanded(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: mainScreenController.rssList.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(20),
                                // margin:
                                //     const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.purple),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      mainScreenController.rssList[index].title,
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
                                          "تاریخ انتشار: ${mainScreenController.rssList[index].pubDate}",
                                          style: MyTextStyle.pubDate,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            myLunchUrl(mainScreenController
                                                .rssList[index].link!);
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
                              SizedBox(height: Get.height / 40),
                            ],
                          );
                        },
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
