import 'package:assessment/apis/apicalls.dart';
import 'package:assessment/controllers/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key, required this.token});
  final String token;
  final DashboardController dashboardController = Get.put(
    DashboardController(),
  );
  @override
  Widget build(BuildContext context) {
    dashboardController.fetchDashboardData();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
                height: 150,
                width: 150,
                child: Image.asset("assets/images/congrats.png")),
          ),
          Text("Congrats  \n ${dashboardController.secret}"),
        ],
      ),
    );
  }
}
