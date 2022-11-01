import 'package:e_commerce/core/utils/color_utils.dart';
import 'package:e_commerce/core/utils/icon_button_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ModalBottomSheet extends StatelessWidget {
  final Widget child;
  const ModalBottomSheet({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SizedBox(
        height: 480.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.all(10.sp),
              child: Align(
                alignment: Alignment.bottomRight,
                child: IconButtonUtil(
                  ontap: () {
                    Get.back();
                  },
                  buttonSize: 48,
                  icon: Icon(
                    Icons.close,
                    size: 30.sp,
                    color: ColorUtils.red,
                  ),
                  background: ColorUtils.white,
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: ColorUtils.white,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
                  child: child,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
