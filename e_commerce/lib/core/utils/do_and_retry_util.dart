import 'package:e_commerce/core/utils/dialog_utils.dart';
import 'package:e_commerce/global/app_text.dart';
import 'package:get/get.dart';

class DoAndRetryUtil {
  static Future<bool> makeAction(Future<ActionResult> Function() action) async {
    // ignore: unnecessary_null_comparison
    if (action == null) return false;

    bool retry = false;
    bool completed = false;
    try {
      do {
        var result = await action();
        if (result.success == false) {
          await DialogUtils.showYesNoDialog(
              title: result.title,
              body: result.message,
              onYes: () {
                retry = true;
                Get.back();
              },
              onNo: () {
                retry = false;
                Get.back();
              });
        } else {
          retry = false;
          completed = true;
        }
      } while (retry == true);
      return completed;
    } catch (e) {
      return false;
    }
  }
}

class ActionResult {
  bool success;
  //if not success, it will show a dialog with below content
  String title;
  String message;

  ActionResult({
    required this.success,
    this.title = AppText.lblWarning,
    this.message = '',
  });
}
