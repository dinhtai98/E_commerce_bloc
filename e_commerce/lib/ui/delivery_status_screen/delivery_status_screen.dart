import 'package:e_commerce/core/ui_models/delivery_status_stepper_ui_model.dart';
import 'package:e_commerce/core/utils/color_utils.dart';
import 'package:e_commerce/core/utils/icon_button_util.dart';
import 'package:e_commerce/core/utils/liner_dashed_painter.dart';
import 'package:e_commerce/core/utils/text_style_utils.dart';
import 'package:e_commerce/global/app_text.dart';
import 'package:e_commerce/ui/common_widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeliveryStatusScreen extends StatelessWidget {
  const DeliveryStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var stepper = [
      DeliveryStatusStepperUIModel(
        image: 'assets/images/order_taken.png',
        title: AppText.lblDeliveryOrderTaken,
        backgroundImage: const Color(0xFFFFFAEB),
        iconButton: IconButtonUtil(
          buttonSize: 30,
          icon: Icon(
            Icons.done,
            size: 20,
            color: ColorUtils.white,
          ),
          onTap: () {},
          background: ColorUtils.green,
        ),
      ),
      DeliveryStatusStepperUIModel(
        image: 'assets/images/order_is_processed.png',
        title: AppText.lblDeliveryOrderIsBeingProcessed,
        backgroundImage: const Color(0xFFF1EFF6),
        iconButton: IconButtonUtil(
          buttonSize: 30,
          icon: Icon(
            Icons.done,
            size: 20,
            color: ColorUtils.white,
          ),
          onTap: () {},
          background: ColorUtils.green,
        ),
      ),
      DeliveryStatusStepperUIModel(
        image: 'assets/images/order_is_delivered.png',
        title: AppText.lblDeliveryOrderIsBeingDelivered,
        description: AppText.lblYourMealIsOnItsWay,
        backgroundImage: const Color(0xFFFEF0F0),
        iconButton: IconButtonUtil(
          buttonSize: 50,
          icon: Icon(
            Icons.phone_in_talk_outlined,
            size: 30,
            color: ColorUtils.white,
          ),
          onTap: () {},
          background: ColorUtils.deepOrange,
        ),
      ),
      DeliveryStatusStepperUIModel(isMap: true),
      DeliveryStatusStepperUIModel(
        image: 'assets/images/order_reveived.png',
        title: AppText.lblOrderReceived,
        iconButton: IconButtonUtil(
          buttonSize: 60.sp,
          icon: Icon(
            Icons.more_horiz,
            size: 60.sp,
            color: ColorUtils.lightOrange,
          ),
          onTap: () {},
          background: ColorUtils.transparent,
        ),
        finalStep: true,
      ),
    ];
    return Scaffold(
      body: CustomAppBarAndBody(
        backgroundColor: ColorUtils.deepOrange,
        activeBackButton: true,
        title: Text(
          AppText.lblDeliveryStatus,
          style: TextStyleUtils.medium(24).copyWith(color: ColorUtils.white),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.sp),
          color: ColorUtils.white,
          child: ListView.builder(
            itemCount: stepper.length,
            itemBuilder: (context, index) {
              var step = stepper[index];
              if (step.isMap) {
                return SizedBox(
                  height: 200.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        height: 150.h,
                        decoration: BoxDecoration(
                            color: ColorUtils.lightOrange,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.sp))),
                      ),
                      step.finalStep
                          ? const SizedBox()
                          : Padding(
                              padding: EdgeInsets.only(left: (50 / 2).sp),
                              child: CustomPaint(
                                painter: LineDashedPainter(
                                    color: ColorUtils.deepOrange),
                              ),
                            )
                    ],
                  ),
                );
              } else {
                return IntrinsicHeight(
                  child: Container(
                    padding: EdgeInsets.only(bottom: 40.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              verticalDirection: VerticalDirection.down,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: step.backgroundImage,
                                    border: Border.all(
                                        color: ColorUtils.transparent),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.r),
                                    ),
                                  ),
                                  child: Image.asset(
                                    step.image!,
                                    height: 50.sp,
                                    width: 50.sp,
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                step.finalStep
                                    ? const SizedBox()
                                    : CustomPaint(
                                        painter: LineDashedPainter(
                                            color: ColorUtils.deepOrange),
                                      )
                              ],
                            ),
                            const SizedBox(width: 10),
                            Padding(
                              padding: EdgeInsets.only(top: 8.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    step.title!,
                                    style: TextStyleUtils.medium(16)
                                        .copyWith(color: ColorUtils.black),
                                  ),
                                  step.description == null
                                      ? const SizedBox.shrink()
                                      : Text(
                                          step.description!,
                                          style: TextStyleUtils.light(14)
                                              .copyWith(
                                                  color: ColorUtils.black),
                                        ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        step.iconButton!
                      ],
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
