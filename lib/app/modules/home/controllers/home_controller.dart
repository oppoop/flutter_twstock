import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  final topHeight = 0.0.obs;
  final ScrollController _scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    _scrollController.addListener(() { });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    _scrollController.dispose();
  }

}
