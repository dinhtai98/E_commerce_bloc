import 'dart:io';

import 'package:e_commerce/core/utils/native_utils.dart';
import 'package:path_provider/path_provider.dart';

class StorageUtils {
  /// directory especially for this app
  static Future<Directory> getApplicationPermanentDirectory() async {
    var storage = await getExternalStorageDirectory();

    /// Determine [rootDataFolder] based on android api version
    /// due to file restriction on api version >= 30 (android 11)
    var rootDataFolder = (await NativeUtils.isAndroidSDK30OrAbove())
        ? storage!.parent.parent
            .parent // = '.../Android' ('../Android/Data' is restricted on api version >= 30)
        : storage!.parent.parent; // = '.../Android/Data'

    var permanentFolder = Directory(rootDataFolder.path + '/tafi_e_commerce');
    if (!permanentFolder.existsSync()) permanentFolder.createSync();
    return permanentFolder;
  }
}
