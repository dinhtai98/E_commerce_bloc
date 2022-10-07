import 'package:e_commerce/core/utils/color_utils.dart';
import 'package:e_commerce/core/utils/custom_button.dart';
import 'package:e_commerce/core/utils/text_style_utils.dart';
import 'package:e_commerce/global/app_text.dart';
import 'package:e_commerce/ui/welcome_screen/widgets/animation_ease_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  late final AnimationController _animationImageController =
      AnimationController(
          duration: const Duration(milliseconds: 600), vsync: this);
  late Animation sizeAnimation =
      Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
    parent: _animationImageController,
    curve: Curves.bounceOut,
  ));

  late final AnimationController _animationBackgroundChangeController =
      AnimationController(
          duration: const Duration(milliseconds: 500), vsync: this);
  late final Animation _animationBackgroundChange =
      Tween<double>(begin: 0, end: 2)
          .animate(_animationBackgroundChangeController);
  final Duration _animationDurationOfText = const Duration(milliseconds: 250);
  @override
  void initState() {
    super.initState();
    _animationBackgroundChangeController.forward();
    Future.delayed(
        _animationBackgroundChangeController.duration! +
            _animationDurationOfText +
            _animationDurationOfText, () {
      _animationImageController.forward();
    });
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void dispose() {
    _animationBackgroundChangeController.dispose();
    _animationImageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedBuilder(
            animation: _animationBackgroundChange,
            child: Container(
              decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.only(topLeft: Radius.circular(500)),
                color: ColorUtils.deepOrange,
              ),
            ),
            builder: (context, widget) => Transform.scale(
              scale: _animationBackgroundChange.value,
              alignment: Alignment.bottomRight,
              child: widget,
            ),
          ),
          Positioned(
            top: 50.h,
            left: 50.w,
            child: AnimatedBuilder(
              animation: _animationImageController,
              child: Center(
                child: Image.asset(
                  'assets/images/welcome_image_basket_of_fruit_and_bee.png',
                  height: 260,
                  width: 300,
                ),
              ),
              builder: (context, widget) => Transform.scale(
                scale: sizeAnimation.value,
                child: widget,
                alignment: const Alignment(0.0, 0.2),
              ),
            ),
          ),
          AnimationEaseIn(
            animationDuration: _animationDurationOfText,
            tween: Tween<Offset>(
                begin: const Offset(0.0, 2.5), end: const Offset(0.0, 1)),
            delay: _animationBackgroundChangeController.duration!,
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              color: ColorUtils.white,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
                child: AnimationEaseIn(
                  animationDuration: _animationDurationOfText,
                  tween: Tween<Offset>(
                      begin: const Offset(0.0, 1.5),
                      end: const Offset(0.0, .1)),
                  delay: _animationBackgroundChangeController.duration! +
                      _animationDurationOfText,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppText.welcomeTitle1,
                        style: TextStyleUtils.bold(16)
                            .copyWith(color: ColorUtils.black, fontSize: 16),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        AppText.welcomeDescription1,
                        style: TextStyleUtils.regular(16)
                            .copyWith(color: ColorUtils.black, fontSize: 16),
                      ),
                      AnimationEaseIn(
                        animationDuration: _animationDurationOfText,
                        child: CustomButton(
                          onPressed: () {
                            //TODO
                          },
                          child: Text(
                            AppText.btnLetsContinue,
                            style: TextStyleUtils.medium(16)
                                .copyWith(color: ColorUtils.white),
                          ),
                          btnColor: ColorUtils.deepOrange,
                          btnRadius: 10,
                        ),
                        delay: _animationBackgroundChangeController.duration! +
                            _animationDurationOfText +
                            _animationDurationOfText,
                        tween: Tween<Offset>(
                            begin: const Offset(0.0, 8.0),
                            end: const Offset(0.0, 2.0)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
