/// this dart file to test cods




import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _HomePageState();
}

class _HomePageState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('My location'),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.location_on),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.vertical_distribute_outlined),
          ),
        ],
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          Positioned(
            bottom: 0.0,
            child: Container(
              width: size.width,

              child: Stack(
                clipBehavior: Clip.hardEdge,
                children: <Widget>[
                  Container(
                    width: size.width,
                    height: size.height,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(50),
                      ),
                      border: Border.all(
                        width: 2,
                        color: Colors.black,
                      ),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/1.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: const Text('Hello'),
                  ),
                  CustomPaint(
                    size: Size(size.width, 80),
                    painter: RPSCustomPainter(),
                  ),
                  Container(
                    color: Colors.black,
                    width: size.width,
                    height: size.height * 0.22,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    Path path0 = Path();
    path0.moveTo(size.width, size.height * 0.9000000);
    path0.quadraticBezierTo(size.width * 0.9997000, size.height * 1.0006000,
        size.width * 0.9500000, size.height);
    path0.quadraticBezierTo(size.width * 0.7248300, size.height,
        size.width * 0.0493200, size.height);
    path0.quadraticBezierTo(size.width * 0.0003600, size.height * 0.9996800, 0,
        size.height * 0.8993600);
    path0.quadraticBezierTo(
        0, size.height * 0.7493700, 0, size.height * 0.2994000);
    path0.quadraticBezierTo(size.width * 0.0110700, size.height * 0.1995400,
        size.width * 0.0506200, size.height * 0.1995200);
    path0.quadraticBezierTo(size.width * 0.2498100, size.height * 0.2403600,
        size.width * 0.5001900, size.height * 0.2489200);
    path0.quadraticBezierTo(size.width * 0.7499600, size.height * 0.2399600,
        size.width * 0.9501500, size.height * 0.1998200);
    path0.quadraticBezierTo(size.width * 0.9901100, size.height * 0.1998800,
        size.width, size.height * 0.2983200);
    path0.lineTo(size.width, size.height * 0.9000000);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
