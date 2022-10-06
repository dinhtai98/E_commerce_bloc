import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function()? onPressed;
  final double height;
  final double minWidth;
  final Color? btnColor;
  final Color textColor;
  final double btnRadius;
  final EdgeInsetsGeometry padding;
  final Widget child;
  final Color? borderColor;
  final Color? disabledColor;

  const CustomButton({
    Key? key,
    required this.onPressed,
    this.height = 50,
    this.minWidth = double.infinity,
    this.btnColor,
    this.textColor = Colors.white,
    this.btnRadius = 4,
    this.padding = const EdgeInsets.all(5),
    required this.child,
    this.borderColor,
    this.disabledColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color tmpBtnColor = btnColor ?? Colors.white;

    return TextButton(
      style: ButtonStyle(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(padding),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) =>
                states.contains(MaterialState.disabled)
                    ? (disabledColor ?? Colors.grey[400])!
                    : (btnColor ?? tmpBtnColor)),
        foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) =>
                states.contains(MaterialState.disabled)
                    ? Colors.white
                    : textColor),
        minimumSize: MaterialStateProperty.all<Size>(Size(minWidth, height)),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(btnRadius),
            side: BorderSide(
              color: borderColor ?? Colors.transparent,
              width: borderColor != null ? 1 : 0,
              style: BorderStyle.solid,
            ),
          ),
        ),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
