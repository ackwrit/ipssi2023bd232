
import 'package:flutter/cupertino.dart';

class MyCustomPath extends CustomClipper<Path>{
  double design;
  MyCustomPath(this.design);

  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path = Path();
    path.lineTo(0, size.height * 0.45 + design);
    path.cubicTo(size.width * 0.33, size.height * 0.45 + design, size.width*0.66, size.height *0.33 +design, size.width , size.height * 0.25 + design);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }

}