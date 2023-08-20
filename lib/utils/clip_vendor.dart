import 'dart:ui';

import 'package:flutter/cupertino.dart';

class clipper_vandor extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height/2);
    // path.quadraticBezierTo(size.width/2, size.height, size.width, size.height/2);
    ///idher pahla ham na ya btana ha k hamara pin point konsa ha or us ka bad ham na
    ///jana kahan tak ha
    path.quadraticBezierTo(size.width*0.2, size.height, size.width/2,size.height*0.9);
    path.quadraticBezierTo(size.width*0.9, size.height*0.8, size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;

  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {

    throw UnimplementedError();
  }

}