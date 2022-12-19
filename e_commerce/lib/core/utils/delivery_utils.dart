import 'package:e_commerce/core/blocs/delivery_blocs/delivery_bloc/delivery_bloc.dart';
import 'package:e_commerce/core/database/entities/delivery/delivery_entity.dart';
import 'package:e_commerce/core/utils/dialog_utils.dart';
import 'package:e_commerce/core/utils/string_extension.dart';
import 'package:e_commerce/global/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeliveryUtils {
  static Future<void> addNewDelivery(BuildContext context,
      {required TextEditingController addressTextEditingController,
      required TextEditingController phoneTextEditingController,
      bool isDefault = false}) async {
    var enoughData = await _checkInformationAndShowDialogAnyIf(
        addressTextEditingController: addressTextEditingController,
        phoneTextEditingController: phoneTextEditingController);
    if (enoughData) {
      var delivery = Delivery(
        address: addressTextEditingController.text,
        phoneNumber: phoneTextEditingController.text,
        isDefault: isDefault,
      );
      context.read<DeliveryBloc>().add(AddDeliveryEvent(delivery: delivery));
    }
  }

  static Future<bool> _checkInformationAndShowDialogAnyIf(
      {required TextEditingController addressTextEditingController,
      required TextEditingController phoneTextEditingController}) async {
    String message = '';
    if (addressTextEditingController.text.isNullOrEmpty()) {
      message = AppText.lblAddressIsEmpty;
    } else if (phoneTextEditingController.text.isNullOrEmpty()) {
      message = AppText.lblPhoneIsEmpty;
    }
    if (!message.isNullOrEmpty()) {
      await DialogUtils.showOkDialog(title: AppText.lblWarning, body: message);
    }
    return message.isNullOrEmpty();
  }
}
