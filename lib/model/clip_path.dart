



import 'package:flutter/material.dart';

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {



    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;



    Path path0 = Path();
    path0.moveTo(size.width,size.height*0.9000000);
    path0.quadraticBezierTo(size.width*0.9997000,size.height*1.0006000,size.width*0.9500000,size.height);
    path0.quadraticBezierTo(size.width*0.7248300,size.height,size.width*0.0493200,size.height);
    path0.quadraticBezierTo(size.width*0.0003600,size.height*0.9996800,0,size.height*0.8993600);
    path0.quadraticBezierTo(0,size.height*0.7493700,0,size.height*0.2994000);
    path0.quadraticBezierTo(size.width*0.0098900,size.height*0.0577400,size.width*0.0987800,size.height*0.0988800);
    path0.quadraticBezierTo(size.width*0.2826300,size.height*0.1505200,size.width*0.5003800,size.height*0.1588400);
    path0.quadraticBezierTo(size.width*0.6930900,size.height*0.1515800,size.width*0.9002800,size.height*0.0994400);
    path0.quadraticBezierTo(size.width*0.9898500,size.height*0.0594800,size.width,size.height*0.2983200);
    path0.lineTo(size.width,size.height*0.9000000);
    path0.close();



    return path0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}