import 'package:e_commerce/core/utils/color_utils.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.background,
      body: Center(child: Image.asset('assets/images/splash_image.png')),
    );
  }
}
