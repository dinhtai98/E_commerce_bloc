import 'package:e_commerce/core/utils/color_utils.dart';
import 'package:e_commerce/core/utils/custom_button.dart';
import 'package:e_commerce/core/utils/text_style_utils.dart';
import 'package:flutter/material.dart';

part 'custom_dialog_simple_yes_no.dart';

class CustomDialogActionButton {
  final Function()? onPressed;
  final Color btnColor;
  final Color textColor;
  final String text;
  final bool isContinue;

  CustomDialogActionButton({
    required this.onPressed,
    this.btnColor = const Color(0xFF4CAF50),
    this.textColor = Colors.white,
    this.text = '',
    this.isContinue = false,
  });
}

class CustomDialog extends StatelessWidget {
  final String titleText;
  final Widget content;
  final List<CustomDialogActionButton> actionButtons;

  const CustomDialog({
    Key? key,
    this.titleText = '',
    required this.content,
    this.actionButtons = const [],
  }) : super(key: key);

  List<Widget> _buildActionButtons() {
    return actionButtons.map((actionButton) {
      return Container(
        margin: const EdgeInsets.fromLTRB(5, 0, 0, 10),
        width: actionButton.isContinue ? 150 : 90,
        child: CustomButton(
          height: 42,
          onPressed: actionButton.onPressed,
          btnColor: actionButton.btnColor,
          textColor: actionButton.textColor,
          child: Text(
            actionButton.text,
            style: TextStyleUtils.bold(20),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        titleText,
        style: TextStyleUtils.bold(25).copyWith(
          color: ColorUtils.red,
          fontWeight: FontWeight.w600,
        ),
      ),
      content: content,
      actions: [
        ..._buildActionButtons(),
        const SizedBox(width: 10),
      ],
    );
  }
}
