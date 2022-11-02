import 'package:e_commerce/core/utils/icon_button_util.dart';
import 'package:flutter/material.dart';

class DeliveryStatusStepperUIModel {
  final String? image;
  final String? title;
  final String? description;
  final Color backgroundImage;
  final bool isMap;
  final IconButtonUtil? iconButton;
  final bool finalStep;

  DeliveryStatusStepperUIModel({
    this.image,
    this.title,
    this.description,
    this.backgroundImage = const Color(0xFFF0FEF8),
    this.isMap = false,
    this.iconButton,
    this.finalStep = false,
  });
}
