import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/controller/home_page_controller.dart';
import 'package:weather/model/clip_path.dart';
import 'package:weather/model/text_style.dart';
import 'package:weather/network/http_handler.dart';

import 'package:weather/utils/search_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomePageController controller = Get.put(HomePageController() );
    ApiHttpHandler apiHttpHandler = Get.put(ApiHttpHandler() );
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: GetBuilder<HomePageController>(builder: (logic) {
          return Text(controller.apiWeatherInfoModel.city);
        }),
        leading: IconButton(
          onPressed: () async {
            String? cityName = await Get.to(SearchPage());
            if (cityName != null) {
              controller.loadData1();
            }
            controller.loadData();
            controller.apiWeatherInfoModel =await apiHttpHandler.getWeatherForCityName(cityName!);
          },
          icon: const Icon(Icons.location_on),
        ),
        actions: [
          IconButton(
            onPressed: () {
              controller.loadData1();
              controller.getCurrentWeatherForMyLocation();
            },
            icon: const Icon(Icons.refresh_sharp),
          ),
        ],
        elevation: 0.0,
      ),
      body: Center(
        child: Obx(
          () => controller.isLoadingData.value
              ? const CircularProgressIndicator()
              : Stack(
                  children: [
                    Container(
                      width: size.width,
                      height: size.height,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.black,
                        ),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/1.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SafeArea(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                color: Colors.transparent,
                                width: size.width * 0.95,
                                height: size.height * 0.25,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        color: Colors.transparent,
                                        child: GetBuilder<HomePageController>(
                                            builder: (logic) {
                                          return Text(
                                            controller.apiWeatherInfoModel.temp
                                                .toStringAsFixed(1),
                                            style: const TextStyle(
                                              fontSize: 150,
                                              color: Colors.white,
                                            ),
                                          );
                                        }),
                                      ),
                                    ),
                                    Expanded(
                                      child: RotatedBox(
                                        quarterTurns: 45,
                                        child: GetBuilder<HomePageController>(
                                            builder: (logic) {
                                          return Text(
                                            controller
                                                .apiWeatherInfoModel.status,
                                            style: const TextStyle(
                                              fontSize: 25,
                                              color: Colors.white,
                                            ),
                                          );
                                        }),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: ClipPath(
                        clipper: TriangleClipper(),
                        child: Container(
                          width: size.width,
                          height: 200.0,
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                height: size.height * 0.06,
                              ),
                              Container(
                                height: 2,
                                width: size.width * 0.09,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              const Text(
                                'Weather Today',
                                style: kNormalTextStyle,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: Center(
                                  child: GetBuilder<HomePageController>(
                                      builder: (logic) {
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        controller
                                                            .apiWeatherInfoModel
                                                            .getImageUrl())))),
                                        Text(
                                          controller.apiWeatherInfoModel.temp
                                              .toStringAsFixed(1),
                                          style: const TextStyle(
                                              color: Colors.black),
                                        )
                                      ],
                                    );
                                  }),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Image.asset('assets/images/2.jpg'),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
