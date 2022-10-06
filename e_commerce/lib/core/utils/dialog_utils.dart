import 'package:e_commerce/core/utils/color_utils.dart';
import 'package:e_commerce/core/utils/custom_button.dart';
import 'package:e_commerce/core/utils/custom_dialog.dart';
import 'package:e_commerce/core/utils/localization_utils.dart';
import 'package:e_commerce/core/utils/string_extension.dart';
import 'package:e_commerce/core/utils/text_style_utils.dart';
import 'package:e_commerce/global/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogUtils {
  static Future<void> showYesNoDialog({
    String? title,
    String? body,
    Function()? onYes,
    Function()? onNo,
    bool barrierDismissible = false,
  }) async {
    onYes ??= () => {Get.back()};
    onNo ??= () => {Get.back()};
    await Get.dialog(
      CustomDialogSimple(
        titleText: title == null ? '' : translations.textStatic(title),
        bodyText: body == null ? '' : translations.textStatic(body),
        actionButtons: [
          CustomDialogActionButton(
            btnColor: Colors.grey[700]!,
            textColor: Colors.white,
            text: translations.textStatic('No'),
            onPressed: onNo,
          ),
          CustomDialogActionButton(
            btnColor: Colors.green,
            textColor: Colors.white,
            text: translations.textStatic('Yes'),
            onPressed: onYes,
          ),
        ],
      ),
      barrierDismissible: barrierDismissible,
    );
  }

  static Future<void> showOkCancelDialog({
    String? title,
    String? body,
    Function()? onOK,
    Function()? onCancel,
    bool barrierDismissible = false,
  }) async {
    onOK ??= () => {Get.back()};
    onCancel ??= () => {Get.back()};

    await Get.dialog(
      CustomDialogSimple(
        titleText: title == null ? '' : translations.textStatic(title),
        bodyText: body == null ? '' : translations.textStatic(body),
        actionButtons: [
          CustomDialogActionButton(
            btnColor: Colors.grey[700]!,
            textColor: Colors.white,
            text: translations.textStatic(AppText.lblCancel),
            onPressed: onCancel,
          ),
          CustomDialogActionButton(
            btnColor: Colors.green,
            textColor: Colors.white,
            text: translations.textStatic(AppText.lblOK),
            onPressed: onOK,
          ),
        ],
      ),
      barrierDismissible: barrierDismissible,
    );
  }

  static Future<void> showOkDialog({
    String? title,
    String? body,
    Function()? onOK,
    bool barrierDismissible = false,
  }) async {
    onOK ??= () => {Get.back()};

    await Get.dialog(
      CustomDialogSimple(
        titleText: title == null ? '' : translations.textStatic(title),
        bodyText: body == null ? '' : translations.textStatic(body),
        actionButtons: [
          CustomDialogActionButton(
            btnColor: Colors.green,
            textColor: Colors.white,
            text: translations.textStatic(AppText.lblOK),
            onPressed: onOK,
          ),
        ],
      ),
      barrierDismissible: barrierDismissible,
    );
  }

  static Future<void> showRetryDialog({
    String? title,
    String? body,
    Function()? onRetry,
    bool barrierDismissible = false,
  }) async {
    onRetry ??= () => {Get.back()};

    await Get.dialog(
      CustomDialogSimple(
        titleText: title == null ? '' : translations.textStatic(title),
        bodyText: body == null ? '' : translations.textStatic(body),
        actionButtons: [
          CustomDialogActionButton(
            btnColor: Colors.green,
            textColor: Colors.white,
            text: translations.textStatic(AppText.lblRetry),
            onPressed: onRetry,
          ),
        ],
      ),
      barrierDismissible: barrierDismissible,
    );
  }

  static Future<void> showContinueDialog({
    String? title,
    String? body,
    Function()? onOK,
    bool barrierDismissible = false,
  }) async {
    onOK ??= () => {Get.back()};

    await Get.dialog(
      CustomDialogSimple(
        titleText: title == null ? '' : translations.textStatic(title),
        bodyText: body == null ? '' : translations.textStatic(body),
        actionButtons: [
          CustomDialogActionButton(
            btnColor: Colors.green,
            textColor: Colors.white,
            text: translations.textStatic(AppText.lblContinue),
            onPressed: onOK,
          ),
        ],
      ),
      barrierDismissible: barrierDismissible,
    );
  }

  static Future<void> showContinueGoBackDialog({
    String? title,
    String? body,
    Function()? onOK,
    Function()? onCancel,
    bool barrierDismissible = false,
  }) async {
    onOK ??= () => {Get.back()};
    onCancel ??= () => {Get.back()};

    await Get.dialog(
      CustomDialogSimple(
        titleText: title == null ? '' : translations.textStatic(title),
        bodyText: body == null ? '' : translations.textStatic(body),
        actionButtons: [
          CustomDialogActionButton(
            isContinue: true,
            btnColor: Colors.grey[700]!,
            textColor: Colors.white,
            text: translations.textStatic(AppText.lblGoBack),
            onPressed: onCancel,
          ),
          CustomDialogActionButton(
            isContinue: true,
            btnColor: Colors.green,
            textColor: Colors.white,
            text: translations.textStatic(AppText.lblContinueAnyway),
            onPressed: onOK,
          ),
        ],
      ),
      barrierDismissible: barrierDismissible,
    );
  }

  static Future<void> showYesNoBottomDialog(
    BuildContext context, {
    required String body,
    Function()? onNo,
    Function()? onYes,
    bool isSaveIt = false,
  }) async {
    onNo ??= () => {Get.back()};
    onYes ??= () => {Get.back()};

    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(60),
                topLeft: Radius.circular(60),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20),
                Text(
                  body,
                  style: TextStyleUtils.regular(35),
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        height: 50,
                        onPressed: onNo,
                        btnColor: ColorUtils.grey,
                        child: Text('No, go back',
                            style: TextStyleUtils.bold(35)
                                .copyWith(color: Colors.white)),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: CustomButton(
                        onPressed: onYes,
                        height: 50,
                        btnColor: ColorUtils.red,
                        child: Text(
                          'Yes',
                          style: TextStyleUtils.bold(35)
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }

  static Future<DateTimeRange?> selectDateRange(
      DateTimeRange currentRange) async {
    DateTimeRange? pickedRange = await showDateRangePicker(
      context: Get.context!,
      initialDateRange: DateTimeRange(
        start: currentRange.start,
        end: currentRange.end,
      ),
      firstDate: DateTime(DateTime.now().month - 1),
      lastDate: DateTime(DateTime.now().year + 1),
      helpText: 'Select Date Range',
      cancelText: 'CANCEL',
      confirmText: 'OK',
      saveText: 'SAVE',
      errorFormatText: 'Invalid format.',
      errorInvalidText: 'Out of range.',
      errorInvalidRangeText: 'Invalid range.',
      fieldStartHintText: 'Start Date',
      fieldEndLabelText: 'End Date',
    );
    return pickedRange;
  }

  static Future<void> showErrorBottomSheetDialog(
    BuildContext context, {
    String msg = 'Error',
    required Function onOk,
  }) async {
    await showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return IntrinsicHeight(
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(40),
                topLeft: Radius.circular(40),
              ),
              color: Colors.white,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
                  Image.asset(
                    'assets/images/dl-warning.png',
                    width: 80,
                    height: 80,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      left: 40,
                      right: 40,
                    ),
                    child: Text(
                      msg,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: CustomButton(
                      height: 48,
                      btnRadius: 5,
                      minWidth: MediaQuery.of(context).size.width / 2.2,
                      onPressed: () {
                        onOk.call();
                        Get.back();
                      },
                      btnColor: const Color(0xffCC1212),
                      textColor: Colors.white,
                      child: const Text(
                        'OK',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
