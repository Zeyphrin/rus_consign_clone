import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rusconsign/Page/profilePage/widgets/tab_bar_profile.dart';
import 'package:rusconsign/Page/profilePage/widgets/profile_info_card.dart';
import 'package:rusconsign/Page/profilePage/widgets/customappbar.dart';
import 'package:rusconsign/Page/registerSeller/controller/mitra_controller.dart';
import 'package:rusconsign/Page/settingPage/setting_controller.dart';
import 'package:rusconsign/authentication/controllers/auth_login_controller.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/extension.dart';
import 'package:rusconsign/utils/text_style.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  Future<void> refreshData() async {
    final AuthLoginController dataProfile = Get.put(AuthLoginController());
    await dataProfile.emailData();
    final MitraController controller = Get.find<MitraController>();
    await controller.initStatusMitra();
  }

  @override
  Widget build(BuildContext context) {
    final img = "https://rusconsign.com";
    final AuthLoginController dataProfile = Get.put(AuthLoginController());
    final SettingController settingController = Get.put(SettingController());

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBarProfile(title: 'profil'.tr),
      body: RefreshIndicator(
        color: AppColors.hargaStat,
        backgroundColor: AppColors.cardIconFill,
        strokeWidth: RefreshProgressIndicator.defaultStrokeWidth,
        onRefresh: () => Future.delayed(
          const Duration(seconds: 2),
          refreshData,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Obx(
                    () {
                      final imageUrl = dataProfile.dataImageUrl.value;
                      return SizedBox(
                        width: 100,
                        height: 100,
                        child: ClipOval(
                          child: imageUrl.isNotEmpty
                              ? Image.network(
                                  "$img${imageUrl.replaceFirst("/storage/profiles/", "/api/storage/public/profiles/")}",
                                  fit: BoxFit.cover,
                                )
                              : Center(
                                  child: Image.network(
                                    'https://avatar.iran.liara.run/public',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                        ),
                      );
                    },
                  ),
                  Text(
                    dataProfile.dataUsername.value.isNotEmpty
                        ? dataProfile.dataUsername.value
                        : "data nama kosong",
                    // : settingController.namaProfileController.text,
                    style: AppTextStyle().title(AppColors.titleLine),
                  ),
                  Text(
                    dataProfile.dataEmail.value,
                    style: AppTextStyle().description(AppColors.description),
                  ),
                ].withSpaceBetween(height: 5),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ProfileInfoCard(
                          icon: FeatherIcons.userCheck,
                          title: 'pengikut'.tr,
                          data: dataProfile.dataPengikut.toString(),
                        ),
                        ProfileInfoCard(
                          icon: FeatherIcons.users,
                          title: 'jumlahJasa'.tr,
                          data: dataProfile.dataJumJasa.toString(),
                        ),
                        ProfileInfoCard(
                          icon: FeatherIcons.box,
                          title: 'jumlahProduk'.tr,
                          data: dataProfile.dataJumProduk.toString(),
                        ),
                        ProfileInfoCard(
                          icon: FeatherIcons.star,
                          title: 'penilaian'.tr,
                          data: dataProfile.dataPenilaian.toString(),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Text(
                      dataProfile.dataBio.value,
                      style: AppTextStyle().textInfo(AppColors.description),
                      maxLines: 5,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ].withSpaceBetween(height: 10),
              ),
              const TabList(),
            ].withSpaceBetween(height: 20),
          ),
        ),
      ),
    );
  }
}
