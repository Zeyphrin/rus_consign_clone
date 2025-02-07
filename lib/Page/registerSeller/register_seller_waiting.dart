import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rusconsign/utils/app_responsive.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/text_style.dart';

class RegisterSellerWaiting extends StatelessWidget {
  const RegisterSellerWaiting({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.background,
      bottomNavigationBar: BottomAppBar(
          surfaceTintColor: Colors.transparent,
          color: Colors.transparent,
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.button2,
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(2))),
                  child: Text(
                    "Kembali",
                    style: AppTextStyle().description(AppColors.background),
                  ),
                ),
              ),
            ],
          )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/images/amico_waiting.svg"),
            SizedBox(height: AppResponsive().screenHeight(context)*0.01,),
            Text('menungguPersetujuan'.tr,
                style: AppTextStyle().title(AppColors.titleLine)),
            SizedBox(height: AppResponsive().screenHeight(context)*0.02,),
            Text(
              'descPersetujuan'.tr,
              style: AppTextStyle().description(AppColors.description),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
