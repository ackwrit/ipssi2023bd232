

import 'package:flutter/material.dart';

class MyCustomArc extends CustomClipper<Path>{
  double radius;
  MyCustomArc(this.radius);

  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path = Path();
    path.moveTo(size.width * 0.66, size.height);
    path.addOval(Rect.fromCircle(center: Offset(size.width*0.9, size.height), radius: radius));

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }

}