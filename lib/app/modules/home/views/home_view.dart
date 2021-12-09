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
                  priceIndex().paddingSymmetric(vertical: 10, horizontal: 15),
                  const SizedBox(
                    height: 30,
                  ),
                  topRank(),
                ],
              ),
            ),
            topMenu(),
          ],
        ));
  }

  ///頂部下拉菜單
  Widget topMenu() {
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
            if (details.globalPosition.dy >= controller.startPositioned!) {
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
                builder: (controller) => Icon(
                  controller.isOpen.value
                      ? Icons.arrow_drop_up
                      : Icons.filter_list_sharp,
                  color: Colors.white,
                  size: controller.isOpen.value ? 30 : 20,
                ),
              )).paddingOnly(bottom: 3),
            ],
          ),
        ),
      ],
    );
  }

  ///加權指數區塊
  Widget priceIndex() {
    return Card(
      color: Colors.grey[200],
      elevation: 15.0,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(14.0))),
      child: Column(
        children: [
          Container(
            width: double.maxFinite,
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
          ).paddingSymmetric(horizontal: 10, vertical: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              indexItem(),
              indexItem(),
              indexItem(isMore: true),
            ],
          ),
        ],
      ),
    );
  }

  Widget indexItem({bool isMore = false}) {
    return Container(
      width: Get.width * 0.25,
      height: Get.width * 0.25,
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
      child: isMore
          ? GestureDetector(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('更多').paddingOnly(left: 5),
                  Icon(Icons.add),
                ],
              ),
            )
          : Column(
              children: [
                Text('上櫃指數').paddingOnly(top: 5),
                const SizedBox(
                  height: 15,
                ),
                Text('9000.43'),
              ],
            ),
    ).paddingSymmetric(vertical: 10, horizontal: 5);
  }

  ///漲跌幅top10
  Widget topRank() {
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(14.0))),
      child: Column(
        children: [
          Container(
            height: 40,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              color: Colors.black87,
            ))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  child: Container(
                    child: Text('漲幅前5'),
                  ),
                ),
                GestureDetector(
                  child: Container(
                    child: Text('跌幅前5'),
                  ),
                ),
                GestureDetector(
                  child: Container(
                    child: Text('成交前5'),
                  ),
                ),
              ],
            ),
          ),
          rankItem(),
          rankItem(),
          rankItem(),
          Divider(
            thickness: 1.5,
          ).paddingSymmetric(vertical: 5),
          Text('查看更多').paddingOnly(bottom: 10),
        ],
      ),
    ).paddingSymmetric(horizontal: 15);
  }

  Widget rankItem() {
    return ListTile(
      leading: Text('1'),
      title: Row(
        children: [
          Text('聯電'),
          const SizedBox(
            width: 15,
          ),
          Icon(Icons.arrow_upward),
          const SizedBox(
            width: 5,
          ),
          Text('9%'),
        ],
      ),
    );
  }
}
