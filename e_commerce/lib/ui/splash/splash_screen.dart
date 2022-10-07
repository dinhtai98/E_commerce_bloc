import 'package:e_commerce/core/utils/color_utils.dart';
import 'package:e_commerce/global/router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(MyRouter.welcomeScreen);
      },
      child: Scaffold(
        backgroundColor: ColorUtils.background,
        body: Center(child: Image.asset('assets/images/splash_image.png')),
      ),
    );
  }
}
