import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  final menuHeight = 0.0.obs;
  final Positioned = 0.0.obs;
  double? startPositioned;
  final isOpen = Rx<bool>(false);
  final ScrollController _scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    _scrollController.dispose();
  }

  void topMenuOpen(){
    if(menuHeight.value > Get.height * 0.3){
      menuHeight.value = Get.height * 0.5;
      isOpen.value = true;
      update();
    }else{
      menuHeight.value = 0;
      isOpen.value = false;
      update();
    }
    startPositioned = 0;
  }

}
