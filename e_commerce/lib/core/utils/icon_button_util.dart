import 'package:e_commerce/core/utils/color_utils.dart';
import 'package:flutter/material.dart';

class IconButtonUtil extends StatelessWidget {
  final Icon icon;
  final double buttonSize;
  final VoidCallback ontap;
  const IconButtonUtil({
    required this.ontap,
    required this.icon,
    required this.buttonSize,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: buttonSize,
        height: buttonSize,
        decoration: BoxDecoration(
          border: Border.all(color: ColorUtils.transparent, width: .5),
          color: ColorUtils.lightOrange,
          shape: BoxShape.circle,
        ),
        child: icon,
      ),
    );
  }
}
