import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';


// 半圓
ClipPath buildClipPath({double height = 100}) {
  return ClipPath(
    clipper: BGTopClipper(height: height / 2),
    child: Container(
      color: Colors.black87,
      height: 60,
      width: Get.width,
    ),
  );
}

class BGTopClipper extends CustomClipper<Path> {
  double height;
  BGTopClipper({this.height = 50});
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, this.height / 3);
    path.quadraticBezierTo(size.width / 2, height * 2, size.width, height / 3);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}