// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rusconsign/authentication/controllers/auth_login_controller.dart';
import 'package:rusconsign/authentication/controllers/google_controller.dart';
import 'package:rusconsign/authentication/widget/text_field_widget.dart';
import 'package:rusconsign/utils/app_responsive.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/text_style.dart';

class LoginPage extends StatelessWidget {
  final GoogleController googleController = GoogleController();

  LoginPage({Key? key}) : super(key: key);

  final AuthLoginController controller = Get.put(AuthLoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage('assets/images/logo.png'),
                  height: 95,
                  width: 68,
                ),
                const SizedBox(height: 80),
                Column(
                  children: [
                    TextFieldInput(
                      hintText: 'masukkanEmail'.tr,
                      controller: controller.emailTextEditingController,
                    ),
                    const SizedBox(height: 12),
                    TextFieldPassword(
                      hintText: 'masukkanPassword'.tr,
                      controller: controller.passwordTextEditingController,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.toNamed('/forgotpasswordpage');
                          },
                          child: Text(
                            textAlign: TextAlign.left,
                            'lupaPassword'.tr,
                            style: AppTextStyle()
                                .description(AppColors.description),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: AppResponsive().screenWidth(context),
                  height: AppResponsive().screenWidth(context) * 0.1,
                  child: ElevatedButton(
                    onPressed: () async {
                      String email = controller.emailTextEditingController.text;
                      String password =
                          controller.passwordTextEditingController.text;

                      if (email.isNotEmpty && password.isNotEmpty) {
                        await controller.login(email, password);
                        if (controller.successfulLogin.value) {
                          Get.offNamed('/menu');
                        } else {
                          Get.snackbar(
                            duration: const Duration(seconds: 2),
                            borderRadius: 10,
                            margin: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 20,
                            ),
                            'gagal'.tr,
                            controller.message.value,
                            backgroundColor: AppColors.error,
                            colorText: Colors.white,
                          );
                        }
                      } else {
                        controller.message.value = 'isiDeskripsi'.tr;
                        controller.successfulLogin.value = false;
                        Get.snackbar(
                          duration: const Duration(seconds: 2),
                          borderRadius: 10,
                          margin: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 20,
                          ),
                          'isi'.tr,
                          controller.message.value,
                          backgroundColor: AppColors.error,
                          colorText: Colors.white,
                        );
                      }
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        AppColors.button1,
                      ),
                    ),
                    child: Text(
                      'Login',
                      style: AppTextStyle().header(AppColors.textButton1),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Column(
                  children: [
                    Text(
                      'loginDengan'.tr,
                      style: AppTextStyle().description(AppColors.description),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        _signinWithGoogle();
                      },
                      child: Image.asset(
                        'assets/images/google_logo.png',
                        height: 40,
                        width: 40,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'belumPunyaAkun'.tr,
                      style: AppTextStyle().description(AppColors.description),
                    ),
                    const SizedBox(width: 6),
                    GestureDetector(
                      onTap: () {
                        Get.offNamed("/register");
                      },
                      child: Text(
                        "Register",
                        style: AppTextStyle()
                            .descriptionBold(AppColors.description),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppResponsive().screenHeight(context) * 0.1),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: AppResponsive().screenWidth(context) * 0.7,
                      child: Text(
                        'descLogin'.tr,
                        textAlign: TextAlign.center,
                        style:
                            AppTextStyle().description(AppColors.description),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _signinWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );

        await firebaseAuth.signInWithCredential(credential);
        print("Sign in with Google succeeded");
        Get.offNamed('/menu');
      } else {
        print("Sign in aborted by user");
      }
    } catch (e) {
      print("Error during sign in with Google: $e");
    }
  }
}
