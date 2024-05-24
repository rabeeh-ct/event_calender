import 'package:event_calender/presentation/screens/calender_view_screen/components/center_text.dart';
import 'package:event_calender/presentation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../calender_view_screen_controller.dart';

class Calender extends StatelessWidget {
  const Calender({super.key});

  @override
  Widget build(BuildContext context) {
    final CalenderViewScreenController screenController = Get.find();
    return Container(
      padding: const EdgeInsets.all(15),
      child: Card(
        elevation: 18.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        color: Colors.white,
        child: Container(
          padding: const EdgeInsets.all(20),
          // padding: const EdgeInsets.only(top: 40, left: 10, right: 10, bottom: 60),
          child: Column(
            children: [
              Obx(() {
                return InkWell(
                  onTap: () => screenController.dateTap(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        DateFormat("MMM").format(screenController.date.value),
                        style: const TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold, color: blackColor),
                      ),
                      10.sBW,
                      Text(
                        DateFormat("yyyy").format(screenController.date.value),
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.normal, color: blackColor),
                      ),
                    ],
                  ),
                );
              }),
              GridView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 7),
                children: const [
                  CenterText(text: "SUN"),
                  CenterText(text: "MON"),
                  CenterText(text: "TUE"),
                  CenterText(text: "WED"),
                  CenterText(text: "THU"),
                  CenterText(text: "FRI"),
                  CenterText(text: "SAT"),
                ],
              ),

              //3rd Part
              const Divider(
                height: 10,
                color: Colors.black12,
                // indent: 50,
                // endIndent: 50,
              ),

              SizedBox(
                height: 270,
                // flex: 3,
                child: PageView.builder(
                  controller: screenController.pageController,
                  itemCount: 100 * 12,
                  onPageChanged: (value) {
                    value < screenController.pageIndex
                        ? screenController.dateBackward(value)
                        : screenController.dateForward(value);
                  },
                  itemBuilder: (context, index) => Obx(() {
                    return GridView.builder(
                      itemCount: screenController.dateList.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 7,
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () => screenController.getDate(
                              tempDate: screenController.dateList[index]),
                          child: Container(
                            width: double.maxFinite,
                            height: double.maxFinite,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: screenController.dateEquality(
                                      screenController.dateList[index],
                                      screenController.date.value)
                                  ? primaryColor
                                  : null,
                              shape: BoxShape.circle,
                              border: screenController.dateEquality(
                                      screenController.dateList[index], DateTime.now())
                                  ? Border.all(color: primaryColor)
                                  : null,
                            ),
                            child: Text(
                              "${screenController.dateList[index].day}",
                              style: screenController.dateList[index].month ==
                                      screenController.date.value.month
                                  ? TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: screenController.dateEquality(
                                              screenController.dateList[index],
                                              screenController.date.value)
                                          ? whiteColor
                                          : blackColor,
                                    )
                                  : TextStyle(color: Colors.grey[600]),
                            ),
                          ),
                        );
                      },
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
