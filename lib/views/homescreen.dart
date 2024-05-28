import 'package:assessment/routes/routes.dart';
import 'package:assessment/views/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class CarouselController extends GetxController {
  var currentIndex = 0.obs;

  void updateIndex(int index) {
    currentIndex.value = index;
  }
}

class CustomIndicator extends StatelessWidget {
  final CarouselController controller;

  CustomIndicator({required this.controller});

  @override
  Widget build(BuildContext context) {
    //this section builds the row
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(2, (index) {
          bool isSelected = controller.currentIndex.value == index;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.symmetric(horizontal: 5.0),
            width: isSelected ? 50.0 : 10.0,
            height: isSelected ? 12.0 : 10.0,
            decoration: BoxDecoration(
              color: isSelected ? HexColor("#111827") : Colors.grey,
              borderRadius: BorderRadius.circular(5.0),
            ),
          );
        }),
      );
    });
  }
}

class Homescreen extends StatelessWidget {
  final CarouselController _controller = Get.put(CarouselController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30.0),
            child: GestureDetector(
              onTap: () {},
              child: Text(
                "Skip",
                style: TextStyle(
                    color: HexColor("#2FA2B9"),
                    fontSize: 20,
                    fontFamily: 'SFPro',
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              child: PageView.builder(
                itemCount: 2, // Number of items in the carousel
                onPageChanged: (index) => _controller.updateIndex(index),
                itemBuilder: (context, index) {
                  return Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      // margin: const EdgeInsets.all(10.0),
                      color: Colors.white,
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/device.png',
                            fit: BoxFit.cover,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Finance app the safest \n     and most trusted",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                      fontFamily: "SFPro"),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: const Text(
                                    "Your finance work starts here. Our here to help you track and deal with speeding up your transactions.",
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14,
                                        fontFamily: "SFPro"),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ));
                },
              ),
            ),
            CustomIndicator(controller: _controller),
            const SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 50),
              height: 60,
              decoration: BoxDecoration(
                color: HexColor("#111827"),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: GestureDetector(
                onTap: () {
                  Get.to(() => Signin());
                },
                child: const Center(
                    child: Text(
                  "Get Started",
                  style: TextStyle(
                      color: Colors.white, fontSize: 20, fontFamily: "SFPro"),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
