import 'package:flutter/material.dart';
import 'package:flutter_twstock/utils/half_circle.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          width: Get.width,
          height: this.controller.topHeight.value,
          color:const Color(0xFF1681FC),
        ),
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            buildClipPath(),
            Center(
              child: IconButton(onPressed:(){}, icon: Icon(
                Icons.filter_list_sharp,
                color: Colors.white,
                size: 20,
              )).paddingOnly(bottom: 3),
            )
          ],
        )
      ],
    ));
  }
}
