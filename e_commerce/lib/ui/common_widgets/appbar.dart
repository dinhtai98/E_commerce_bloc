import 'package:badges/badges.dart';
import 'package:e_commerce/core/utils/color_utils.dart';
import 'package:e_commerce/core/utils/text_style_utils.dart';
import 'package:e_commerce/global/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final Widget? title;
  final bool activeBackButton;
  final bool activeBasketButton;
  final Color backgroundColor;
  const CustomAppBar({
    Key? key,
    this.leading,
    this.title,
    this.activeBackButton = false,
    this.activeBasketButton = false,
    this.backgroundColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              leading != null
                  ? leading!
                  : (activeBackButton
                      ? const _BuildBackButton()
                      : const SizedBox.shrink()),
              title ?? const SizedBox.shrink(),
            ],
          ),
          activeBasketButton ? const _BuildBasket() : const SizedBox.shrink(),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(_toolbarHeight);
}

const double _toolbarHeight = 65;

class _BuildBasket extends StatelessWidget {
  const _BuildBasket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.h,
      height: 50.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: ColorUtils.white,
        border: Border.all(width: 1, color: ColorUtils.grey70),
      ),
      child: IconButton(
        onPressed: () {
          //TODO
        },
        iconSize: 20.sp,
        icon: Badge(
          position: BadgePosition.bottomEnd(
            end: 15.w,
            bottom: -7.h,
          ),
          animationDuration: const Duration(milliseconds: 300),
          animationType: BadgeAnimationType.scale,
          badgeColor: const Color(0xFFEADC03),
          elevation: 1,
          showBadge: false,
          padding: EdgeInsets.all(6.r),
          badgeContent: Text(
            '1',
            style: TextStyleUtils.medium(15),
            textAlign: TextAlign.center,
          ),
          // : const SizedBox.shrink(),
          child: Image.asset(
            'assets/images/bag.png',
            height: 50.r,
          ),
        ),
      ),
    );
  }
}

class _BuildBackButton extends StatelessWidget {
  const _BuildBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorUtils.white,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.sp),
        child: InkWell(
          onTap: () {
            Get.back();
          },
          child: Row(
            children: [
              Icon(
                Icons.arrow_back_ios_sharp,
                size: 20.sp,
                color: ColorUtils.black,
              ),
              Text(
                AppText.lblGoBack,
                style: TextStyleUtils.regular(12)
                    .copyWith(color: ColorUtils.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
