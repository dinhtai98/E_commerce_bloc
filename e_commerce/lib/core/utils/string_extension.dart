import 'package:flutter/material.dart';

extension StringExtension on String {
  bool isNullOrEmpty() {
    // ignore: unnecessary_null_comparison
    return this == null || this == '';
  }

  List<String> divideAndWrapText(int width) {
    var remain = trimLeft();
    var result = <String>[];
    while (remain != '') {
      var numOfCharToTake = _findNumOfCharToTakeForWrapping(remain, width);
      result.add(remain.substring(0, numOfCharToTake));
      remain = remain.substring(numOfCharToTake);
      remain = remain.trimLeft();
    }
    return result;
  }

  int _findNumOfCharToTakeForWrapping(String str, int maxWidth) {
    if (str.length <= maxWidth) {
      return str.length;
    }
    var nextSpaceIndex = str.indexOf(' ');
    if (nextSpaceIndex == -1 || nextSpaceIndex >= maxWidth) {
      // no more space or space position is farther than width limit
      return maxWidth;
    } // max size
    // find appropriate space = farthest position that < maxWidth
    var subStr = str.substring(0, maxWidth); // str.length now > maxWidth
    return subStr.lastIndexOf(' ');
  }

  double toTimeOfDayAsDouble() {
    TimeOfDay _time = TimeOfDay(
        hour: int.parse(split(":")[0]), minute: int.parse(split(":")[1]));
    return _time.hour + _time.minute / 60.0;
  }

  TimeOfDay toTimeOfDay() {
    return TimeOfDay(
        hour: int.parse(split(":")[0]), minute: int.parse(split(":")[1]));
  }
}
