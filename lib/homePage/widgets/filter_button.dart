import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rusconsign/utils/app_responsive.dart';
import 'package:rusconsign/utils/colors.dart';
import '../home_page_controller.dart';

class FilterButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final int index;

  const FilterButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomePageController filterButtonController = Get.find();

    return Obx(() => ElevatedButton.icon(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
              return filterButtonController.selectedIndex == index
                  ? AppColors.button1
                  : AppColors.cardIconFill;
            }),
            shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            fixedSize: MaterialStateProperty.all<Size>(
              Size(AppResponsive().screenWidth(context) * 0.290,
                  AppResponsive().screenHeight(context) * 0.04),
            ),
          ),
          icon: Icon(
            icon,
            color: filterButtonController.selectedIndex == index
                ? AppColors.activeIconType
                : AppColors.nonActiveIcon,
          ),
          label: Text(
            text,
            style: TextStyle(
              color: filterButtonController.selectedIndex == index
                  ? AppColors.textButton1
                  : AppColors.description,
              fontSize: 12,
            ),
          ),
          onPressed: () {
            if (filterButtonController.selectedIndex != index) {
              filterButtonController.setSelectedFilter(index);
            }
          },
        ));
  }
}
