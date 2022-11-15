import 'package:e_commerce/core/blocs/account_bloc/account_bloc.dart';
import 'package:e_commerce/core/database/entities/account_entity.dart';
import 'package:e_commerce/core/utils/animation_ease_in.dart';
import 'package:e_commerce/core/utils/color_utils.dart';
import 'package:e_commerce/core/utils/custom_button.dart';
import 'package:e_commerce/core/utils/dialog_utils.dart';
import 'package:e_commerce/core/utils/string_extension.dart';
import 'package:e_commerce/core/utils/text_style_utils.dart';
import 'package:e_commerce/global/app_text.dart';
import 'package:e_commerce/global/custom_input_field.dart';
import 'package:e_commerce/global/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen>
    with TickerProviderStateMixin {
  late final AnimationController _animationImageController =
      AnimationController(
          duration: const Duration(milliseconds: 600), vsync: this);
  late Animation sizeAnimation =
      Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
    parent: _animationImageController,
    curve: Curves.bounceOut,
  ));
  final Duration _animationDurationOfText = const Duration(milliseconds: 250);
  final TextEditingController _nameTextEditingController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    _animationImageController.forward();
  }

  @override
  void dispose() {
    _animationImageController.dispose();
    _nameTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 2,
                      color: ColorUtils.deepOrange,
                    ),
                    Positioned(
                      top: 50.h,
                      left: MediaQuery.of(context).size.width / 2 - 180.w,
                      child: AnimatedBuilder(
                        animation: _animationImageController,
                        child: Center(
                          child: Image.asset(
                            'assets/images/image_fruit_basket.png',
                            height: 340.h,
                            width: 360.w,
                          ),
                        ),
                        builder: (context, widget) => Transform.scale(
                          scale: sizeAnimation.value,
                          child: widget,
                          alignment: const Alignment(0.0, 0.2),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                  color: ColorUtils.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 24),
                    child: AnimationEaseIn(
                      animationDuration: _animationDurationOfText,
                      offset: Tween<Offset>(
                          begin: const Offset(0.0, 1.5),
                          end: const Offset(0.0, .1)),
                      delay: _animationDurationOfText,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 120.h,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppText.authenticationTitle1,
                                  style: TextStyleUtils.bold(16).copyWith(
                                      color: ColorUtils.black, fontSize: 16),
                                ),
                                SizedBox(
                                  height: 17.h,
                                ),
                                CustomTextInputField(
                                  controller: _nameTextEditingController,
                                  hintText: AppText.lblName,
                                  hintStyle: TextStyleUtils.medium(16)
                                      .copyWith(color: ColorUtils.grey70),
                                )
                              ],
                            ),
                          ),
                          AnimationEaseIn(
                            animationDuration: _animationDurationOfText,
                            child: CustomButton(
                              onPressed: _onStartOrderingButton,
                              child: Text(
                                AppText.btnStartOrdering,
                                style: TextStyleUtils.medium(16)
                                    .copyWith(color: ColorUtils.white),
                              ),
                              btnColor: ColorUtils.deepOrange,
                              btnRadius: 10,
                            ),
                            delay: _animationDurationOfText +
                                _animationDurationOfText,
                            offset: Tween<Offset>(
                                begin: const Offset(0.0, 8.0),
                                end: const Offset(0.0, 1.3)),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _onStartOrderingButton() async {
    if (_nameTextEditingController.text.isNullOrEmpty()) {
      await DialogUtils.showOkDialog(
          title: AppText.lblWarning, body: AppText.lblNameIsEmpty);
      return;
    }
    var account = Account(name: _nameTextEditingController.text);
    context.read<AccountBloc>().add(InsertAccountEvent(account: account));
    Get.toNamed(MyRouter.homeScreen);
  }
}
