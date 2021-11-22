import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      width: Get.width*0.5,
      child: Column(
        children: [
          Center(
            child: DrawerHeader(child: Container(color: Colors.amber,)),
          )
        ],
      ),
    );
  }
}