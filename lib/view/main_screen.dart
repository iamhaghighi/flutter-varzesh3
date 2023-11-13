import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/components.dart';
import '../components/my_colors.dart';
import '../components/my_text_style.dart';
import '../controller/main_screen_controller.dart';

class MainScreen extends StatelessWidget {
  MainScreen({
    super.key,
  });

  final MainScreenController mainScreenController = Get.put(
    MainScreenController(),
  );
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: Drawer(
        backgroundColor: MyColors.box,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 35, bottom: 20),
                child: Image.asset("assets/images/varzesh3_logo.png", scale: 2),
              ),
              // About
              const ListTile(
                title: Text("درباره ورزش سه", style: MyTextStyle.readMore),
              ),
              const Divider(
                color: Color.fromARGB(78, 0, 131, 143),
                indent: 15,
                endIndent: 15,
              ),
              // Share
              ListTile(
                title: const Text(
                  "اشتراک گذاری ورزش سه",
                  style: MyTextStyle.readMore,
                ),
                onTap: () async {
                  // await Share.share(
                  //   'آخرین اخبار ورزشی در برنامه ورزش 3 - https://github.com/iamhaghighi.com/flutter-varzesh3',
                  //   subject: 'ورزش سه',
                  // );
                },
              ),
              const Divider(
                color: Color.fromARGB(78, 0, 131, 143),
                indent: 15,
                endIndent: 15,
              ),
              // Github
              ListTile(
                title: const Text("ورزش سه در گیت هاب",
                    style: MyTextStyle.readMore),
                onTap: () async {
                  await myLunchUrl(
                      'https://github.com/iamhaghighi/flutter-varzesh3');
                },
              ),
              const Divider(
                color: Color.fromARGB(78, 0, 131, 143),
                indent: 15,
                endIndent: 15,
              ),
            ],
          ),
        ),
      ),
      backgroundColor: MyColors.bg,
      body: Padding(
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
                  InkWell(
                    onTap: () {
                      _key.currentState!.openDrawer();
                    },
                    child: const Icon(Icons.menu),
                  ),
                  const Text(
                    "ورزش سه",
                    style: MyTextStyle.appBarTitle,
                  ),
                  InkWell(
                    onTap: () {
                      mainScreenController.getAllSportsNews();
                      mainScreenController.changeStyle(0);
                    },
                    child: const Icon(Icons.refresh, color: MyColors.appTitle),
                  ),
                ],
              ),
            ),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  mainScreenController.texts.length,
                  (index) => InkWell(
                    onTap: () {
                      mainScreenController.changeStyle(index);
                      switch (index) {
                        case 0:
                          mainScreenController.getAllSportsNews();
                          break;
                        case 1:
                          mainScreenController.getInsideFootballNews();
                          break;
                        case 2:
                          mainScreenController.getOutSideFootballNews();
                          break;
                        case 3:
                          mainScreenController.getOtherSportsNews();
                          break;
                      }
                    },
                    child: Row(
                      children: [
                        Text(
                          "- ",
                          style: TextStyle(
                            fontFamily: 'dana',
                            fontSize: 13,
                            fontWeight: FontWeight.w300,
                            color: mainScreenController.colors[index],
                          ),
                        ),
                        Text(
                          "${mainScreenController.texts[index]}",
                          style: TextStyle(
                            fontFamily: 'dana',
                            fontSize: 13,
                            fontWeight: mainScreenController.weights[index],
                            color: mainScreenController.colors[index],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Obx(
              () => mainScreenController.loading.value != false
                  ? Expanded(child: myLoading())
                  : Expanded(
                      child: RefreshIndicator(
                        color: Colors.black,
                        onRefresh: () async {
                          await Future.delayed(
                            const Duration(seconds: 1),
                          ).then(
                            (value) async {
                              mainScreenController.changeStyle(0);
                              await mainScreenController.getAllSportsNews();
                            },
                          );
                          // await mainScreenController.getAllSportsNews();
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
