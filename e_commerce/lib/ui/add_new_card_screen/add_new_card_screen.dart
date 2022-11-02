import 'package:e_commerce/core/utils/color_utils.dart';
import 'package:e_commerce/core/utils/custom_button.dart';
import 'package:e_commerce/core/utils/date_time_util.dart';
import 'package:e_commerce/core/utils/modal_bottom_sheet_util.dart';
import 'package:e_commerce/core/utils/text_style_utils.dart';
import 'package:e_commerce/global/app_text.dart';
import 'package:e_commerce/global/custom_input_field.dart';
import 'package:e_commerce/global/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddNewCard extends StatefulWidget {
  const AddNewCard({super.key});

  @override
  State<AddNewCard> createState() => _AddNewCardState();
}

class _AddNewCardState extends State<AddNewCard> {
  final TextEditingController _cardHoldersTextEditingController =
      TextEditingController();
  final TextEditingController _cardNumberTextEditingController =
      TextEditingController();
  final TextEditingController _dateTextEditingController =
      TextEditingController();
  final TextEditingController _cvvTextEditingController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ModalBottomSheet(
      height: 550,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppText.lblCardHolderName,
            style: TextStyleUtils.regular(16).copyWith(color: ColorUtils.blue),
          ),
          CustomTextInputField(
            controller: _cardHoldersTextEditingController,
            hintText: AppText.lblAddressHint,
            hintStyle:
                TextStyleUtils.medium(16).copyWith(color: ColorUtils.grey70),
          ),
          Text(
            AppText.lblCardNumber,
            style: TextStyleUtils.regular(16).copyWith(color: ColorUtils.blue),
          ),
          CustomTextInputField(
            controller: _cardNumberTextEditingController,
            hintText: AppText.lblPhoneHint,
            hintStyle:
                TextStyleUtils.medium(16).copyWith(color: ColorUtils.grey70),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 150.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppText.lblDate,
                      style: TextStyleUtils.regular(16)
                          .copyWith(color: ColorUtils.blue),
                    ),
                    SizedBox(height: 17.h),
                    InkWell(
                      onTap: () async {
                        var date = await DateTimeUtils.buildCupertinoDatePicker(
                            context);
                        _dateTextEditingController.text =
                            DateTimeUtils.dateFormat.format(date);
                      },
                      child: CustomTextInputField(
                        enabled: false,
                        controller: _dateTextEditingController,
                        hintText: AppText.lblDateHint,
                        hintStyle: TextStyleUtils.medium(16)
                            .copyWith(color: ColorUtils.grey70),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 150.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppText.lblCVV,
                      style: TextStyleUtils.regular(16)
                          .copyWith(color: ColorUtils.blue),
                    ),
                    SizedBox(height: 17.h),
                    InkWell(
                      onTap: () async {
                        var date = await DateTimeUtils.buildCupertinoDatePicker(
                            context);
                        _cvvTextEditingController.text =
                            DateTimeUtils.dateFormat.format(date);
                      },
                      child: CustomTextInputField(
                        enabled: false,
                        controller: _cvvTextEditingController,
                        hintText: AppText.lblDateHint,
                        hintStyle: TextStyleUtils.medium(16)
                            .copyWith(color: ColorUtils.grey70),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Center(
            child: CustomButton(
              onPressed: () {
                Get.toNamed(MyRouter.orderCompleted);
              },
              child: Text(
                AppText.btnCompleteOrder,
                style:
                    TextStyleUtils.medium(16).copyWith(color: ColorUtils.white),
              ),
              btnColor: ColorUtils.deepOrange,
              btnRadius: 10,
              height: 56.h,
              minWidth: 199.w,
            ),
          )
        ],
      ),
    );
  }
}
