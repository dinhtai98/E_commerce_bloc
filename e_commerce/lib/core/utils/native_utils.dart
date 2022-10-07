import 'package:device_info_plus/device_info_plus.dart';

class NativeUtils {
  static Future<bool> isAndroidSDK30OrAbove() async {
    var androidInfo = await DeviceInfoPlugin().androidInfo;
    return androidInfo.version.sdkInt! >= 30;
  }
}
