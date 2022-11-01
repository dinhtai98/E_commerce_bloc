import 'package:e_commerce/core/utils/color_utils.dart';
import 'package:e_commerce/core/utils/custom_button.dart';
import 'package:e_commerce/core/utils/modal_bottom_sheet_util.dart';
import 'package:e_commerce/core/utils/text_style_utils.dart';
import 'package:e_commerce/global/app_text.dart';
import 'package:e_commerce/global/custom_input_field.dart';
import 'package:e_commerce/ui/add_new_card_screen/add_new_card_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DeliveryDetailWidget extends StatefulWidget {
  const DeliveryDetailWidget({super.key});

  @override
  State<DeliveryDetailWidget> createState() => _DeliveryDetailWidgetState();
}

class _DeliveryDetailWidgetState extends State<DeliveryDetailWidget> {
  final TextEditingController _phoneTextEditingController =
      TextEditingController();
  final TextEditingController _addressTextEditingController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ModalBottomSheet(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            AppText.lblYourDeliveryAddress,
            style: TextStyleUtils.regular(16).copyWith(color: ColorUtils.blue),
          ),
          CustomTextInputField(
            controller: _addressTextEditingController,
            hintText: AppText.lblAddressHint,
            hintStyle:
                TextStyleUtils.medium(16).copyWith(color: ColorUtils.grey70),
          ),
          Text(
            AppText.lblNumberWeCanCall,
            style: TextStyleUtils.regular(16).copyWith(color: ColorUtils.blue),
          ),
          CustomTextInputField(
            controller: _phoneTextEditingController,
            hintText: AppText.lblPhoneHint,
            hintStyle:
                TextStyleUtils.medium(16).copyWith(color: ColorUtils.grey70),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                onPressed: () {
                  //TODO Pay on Delivery
                },
                child: Text(
                  AppText.btnPayOnDelivery,
                  style: TextStyleUtils.medium(16)
                      .copyWith(color: ColorUtils.deepOrange),
                ),
                btnColor: ColorUtils.lightOrange,
                btnRadius: 10,
                height: 56.h,
                minWidth: 160.w,
              ),
              CustomButton(
                onPressed: () {
                  Get.back();
                  showModalBottomSheet(
                    backgroundColor: ColorUtils.transparent,
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return const AddNewCard();
                    },
                  );
                },
                child: Text(
                  AppText.btnPayOnDelivery,
                  style: TextStyleUtils.medium(16)
                      .copyWith(color: ColorUtils.deepOrange),
                ),
                btnColor: ColorUtils.lightOrange,
                btnRadius: 10,
                height: 56.h,
                minWidth: 160.w,
              )
            ],
          )
        ],
      ),
    );
  }
}
