import 'package:flutter/material.dart';
import 'package:flutter_twstock/utils/half_circle.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    double position;
    return Scaffold(
        body: Column(
      children: [
        Obx(
          () => Container(
            width: Get.width,
            height: this.controller.menuHeight.value,
            color: const Color(0xFF1681FC),
          ),
        ),
        GestureDetector(
          onVerticalDragDown: (DragDownDetails e) {
            controller.startPositioned = e.globalPosition.dy;
          },
          onVerticalDragUpdate: (DragUpdateDetails details) {
            if (details.globalPosition.dy >=
                controller.startPositioned!) {
              controller.menuHeight.value =
                  details.globalPosition.dy - controller.startPositioned!;
            }
          },
          onVerticalDragEnd: (DragEndDetails details) {
            controller.topMenuOpen();
          },
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              buildClipPath(),
              Center(
                child: GetBuilder<HomeController>(
                  builder: (controller)=>Icon(
                    controller.isOpen.value ?Icons.arrow_drop_up :Icons.filter_list_sharp,
                    color: Colors.white,
                    size: controller.isOpen.value ? 30 : 20,
                  ),
                )
              ).paddingOnly(bottom: 3),
            ],
          ),
        ),
      ],
    ));
  }
}
