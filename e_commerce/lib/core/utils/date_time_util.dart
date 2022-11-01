import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeUtils {
  static DateFormat dateFormat = DateFormat('MM/yy');
  static Future<DateTime> buildCupertinoDatePicker(BuildContext context) async {
    DateTime datePicker = DateTime.now();
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return Container(
          height: MediaQuery.of(context).copyWith().size.height / 3,
          color: Colors.white,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: (picked) {
              datePicker = picked;
            },
            initialDateTime: DateTime.now(),
            minimumYear: 2000,
            maximumYear: DateTime.now().year,
          ),
        );
      },
    );
    return datePicker;
  }
}
