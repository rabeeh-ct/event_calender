import 'package:event_calender/presentation/widgets/network_resource.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/calender_home.dart';
import 'home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeScreenController screenController = Get.find();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        // leading: const Icon(Icons.arrow_back_ios),
        elevation: 0,
      ),
      body: Obx(() {
          return NetworkResource(
            appError: screenController.appError,
            loading: screenController.pageLoading.value,
            retry: screenController.getData,
            child: const CalenderHome(),
          );
        }
      ),
    );
  }
}
