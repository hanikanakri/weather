import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/utils/search_page.dart';

import 'utils/home_page.dart';

void main() {
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,


      theme: ThemeData.light(),
      getPages: [GetPage(name: '/', page: () =>const HomePage(),),
      GetPage(name: '/SearchPage', page: () => SearchPage())],
    );
  }
}
