import 'package:dart_rss/dart_rss.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:varzesh3/components/my_colors.dart';

import '../components/my_strings.dart';
import '../services/dio_service.dart';

class MainScreenController extends GetxController {
  RssFeed? rssFeed;
  RxList rssList = RxList();
  RxBool loading = true.obs;
  RxString appBarTitle = MyStrings.allSports.obs;

  RxList<String> texts = [
    "آخرین اخبار فوتبال",
    "اخبار داخلی",
    "اخبار خارجی",
    "سایر اخبارها",
  ].obs;
  RxList<Color> colors = [
    MyColors.topBox,
    MyColors.hashTag,
    MyColors.hashTag,
    MyColors.hashTag,
  ].obs;
  RxList<FontWeight> weights = [
    FontWeight.w700,
    FontWeight.w300,
    FontWeight.w300,
    FontWeight.w300,
  ].obs;
  void changeStyle(int index) {
    for (int i = 0; i < texts.length; i++) {
      colors[i] =
          (i == index) ? MyColors.topBox : MyColors.hashTag;
      weights[i] = (i == index) ? FontWeight.w700 : FontWeight.w300;
    }
  }

  @override
  onInit() {
    super.onInit();
    getAllSportsNews();
  }

  getAllSportsNews() async {
    loading.value = true;
    var response =
        await DioService().getRssMethod("https://www.varzesh3.com/rss/all");
    if (response.statusCode == 200) {
      rssList.clear();
      rssFeed = RssFeed.parse(response.data);
      rssFeed?.items.forEach(
        (element) {
          rssList.add(element);
        },
      );
      loading.value = false;
    }
  }

  getInsideFootballNews() async {
    loading.value = true;
    var response = await DioService()
        .getRssMethod("https://www.varzesh3.com/rss/domesticfootball");
    if (response.statusCode == 200) {
      rssList.clear();
      rssFeed = RssFeed.parse(response.data);
      rssFeed?.items.forEach(
        (element) {
          rssList.add(element);
        },
      );
      loading.value = false;
    }
  }

  getOutSideFootballNews() async {
    loading.value = true;
    var response = await DioService()
        .getRssMethod("https://www.varzesh3.com/rss/foreignfootball");
    if (response.statusCode == 200) {
      rssList.clear();
      rssFeed = RssFeed.parse(response.data);
      rssFeed?.items.forEach(
        (element) {
          rssList.add(element);
        },
      );
      loading.value = false;
    }
  }

  getOtherSportsNews() async {
    loading.value = true;
    var response = await DioService()
        .getRssMethod("https://www.varzesh3.com/rss/othersports");

    if (response.statusCode == 200) {
      rssList.clear();
      rssFeed = RssFeed.parse(response.data);
      rssFeed?.items.forEach(
        (element) {
          rssList.add(element);
        },
      );
      loading.value = false;
    }
  }
}
