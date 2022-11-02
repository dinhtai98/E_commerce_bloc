import 'package:e_commerce/core/utils/animation_ease_in.dart';
import 'package:e_commerce/core/utils/color_utils.dart';
import 'package:e_commerce/core/utils/custom_button.dart';
import 'package:e_commerce/core/utils/text_style_utils.dart';
import 'package:e_commerce/global/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderCompletedScreen extends StatefulWidget {
  const OrderCompletedScreen({super.key});

  @override
  State<OrderCompletedScreen> createState() => _OrderCompletedScreenState();
}

class _OrderCompletedScreenState extends State<OrderCompletedScreen>
    with TickerProviderStateMixin {
  late final AnimationController _animationImageController =
      AnimationController(
          duration: const Duration(milliseconds: 600), vsync: this);
  late Animation sizeAnimation =
      Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
    parent: _animationImageController,
    curve: Curves.bounceOut,
  ));

  @override
  void initState() {
    _animationImageController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationImageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 100.h, horizontal: 60.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AnimatedBuilder(
              animation: _animationImageController,
              child: Center(
                child: Image.asset(
                  'assets/images/oder-completed.png',
                  height: 200.h,
                  width: 250.w,
                ),
              ),
              builder: (context, widget) => Transform.scale(
                scale: sizeAnimation.value,
                child: widget,
                alignment: const Alignment(0.0, 0.15),
              ),
            ),
            const _BuildDescription(),
            AnimationEaseIn(
              child: const _BuildButtonList(),
              animationDuration: const Duration(milliseconds: 200),
              delay: Duration.zero,
              offset: Tween<Offset>(
                  begin: const Offset(0.0, 1.5), end: const Offset(0.0, 0.0)),
            ),
          ],
        ),
      ),
    );
  }
}

class _BuildDescription extends StatelessWidget {
  const _BuildDescription();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            AppText.lblOrderTaken,
            style: TextStyleUtils.regular(32).copyWith(color: ColorUtils.blue),
          ),
          Text(
            AppText.lblOrderCompletedDescription,
            style: TextStyleUtils.regular(16).copyWith(color: ColorUtils.blue),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _BuildButtonList extends StatelessWidget {
  const _BuildButtonList();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 210.w,
            child: CustomButton(
              onPressed: () {
                //TODO Track order
              },
              child: Text(
                AppText.btnTrackOrder,
                style:
                    TextStyleUtils.medium(16).copyWith(color: ColorUtils.white),
              ),
              btnColor: ColorUtils.deepOrange,
              btnRadius: 10,
            ),
          ),
          SizedBox(
            width: 170.w,
            child: CustomButton(
              onPressed: () {
                //TODO continue shopping
              },
              child: Text(
                AppText.btnContinueShopping,
                style: TextStyleUtils.medium(16)
                    .copyWith(color: ColorUtils.deepOrange),
              ),
              btnColor: ColorUtils.lightOrange,
              btnRadius: 10,
            ),
          )
        ],
      ),
    );
  }
}
