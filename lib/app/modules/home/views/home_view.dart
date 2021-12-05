import 'package:flutter/material.dart';
import 'package:flutter_twstock/utils/half_circle.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
        body: Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: Get.width,
                height: 70,
              ),
              priceIndex().paddingSymmetric(vertical:10,horizontal: 15),
            ],
          ),
        ),
        topMenu(),
      ],
    ));
  }

  Widget topMenu(){
    return Column(
      children: [
        Obx(
              () => Container(
            width: Get.width,
            height: this.controller.menuHeight.value,
            color: Colors.black87,
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
    );
  }

  Widget priceIndex(){
    return Card(
      color: Colors.grey[200],
      elevation: 15.0,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0))),
      child: Column(
        children: [
          Container(
            width:double.maxFinite,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    offset: Offset(3.0, 3.0), //陰影y軸偏移量
                    blurRadius: 5, //陰影模糊程度
                    spreadRadius: 1 //陰影擴散程度
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('加權指數'),
                Text('17693.43'),
              ],
            ),
          ).paddingSymmetric(horizontal: 10,vertical: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              indexItem(),
              indexItem(),
              indexItem(),
            ],
          ),
        ],
      ),
    );
  }

  Widget indexItem(){
    return Container(
      width: Get.width*0.25,
      height: Get.width*0.25,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              color: Colors.black26,
              offset: Offset(3.0, 3.0), //陰影y軸偏移量
              blurRadius: 5, //陰影模糊程度
              spreadRadius: 1 //陰影擴散程度
          )
        ],
      ),
      child: Column(
        children: [
          Text('上櫃指數').paddingOnly(top: 5),
          const SizedBox(
            height: 15,
          ),
          Text('9000.43'),
        ],
      ),
    ).paddingSymmetric(vertical: 10,horizontal: 5);
  }
}
