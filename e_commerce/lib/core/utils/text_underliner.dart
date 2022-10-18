import 'package:e_commerce/core/utils/color_utils.dart';
import 'package:e_commerce/core/utils/text_style_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextUnderLine extends StatelessWidget {
  final String title;
  final bool activeUnderline;
  const TextUnderLine({
    Key? key,
    required this.title,
    this.activeUnderline = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyleUtils.regular(18).copyWith(color: ColorUtils.blue),
        ),
        activeUnderline
            ? SizedBox(
                width: 56.w,
                child: Divider(
                  thickness: 2,
                  color: ColorUtils.deepOrange,
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
