import 'package:e_commerce/core/blocs/basket_blocs/basket_bloc/basket_bloc.dart';
import 'package:e_commerce/core/blocs/home_blocs/quantity_cubit/quantity_cubit.dart';
import 'package:e_commerce/core/ui_models/product_ui_model.dart';
import 'package:e_commerce/core/utils/animation_ease_in.dart';
import 'package:e_commerce/core/utils/color_utils.dart';
import 'package:e_commerce/core/utils/custom_button.dart';
import 'package:e_commerce/core/utils/icon_button_util.dart';
import 'package:e_commerce/core/utils/text_style_utils.dart';
import 'package:e_commerce/core/utils/text_underliner.dart';
import 'package:e_commerce/global/app_text.dart';
import 'package:e_commerce/global/global_data.dart';
import 'package:e_commerce/global/locator.dart';
import 'package:e_commerce/global/router.dart';
import 'package:e_commerce/ui/common_widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

part 'widgets/combo_contain_widgets.dart';
part 'widgets/description_of_product.dart';

class ProductScreenArguments {
  final ProductUIModel product;

  ProductScreenArguments({required this.product});
}

class ProductScreen extends StatefulWidget {
  final ProductScreenArguments arguments;
  const ProductScreen({required this.arguments, super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen>
    with TickerProviderStateMixin {
  late final AnimationController _animationImageController =
      AnimationController(
          duration: const Duration(milliseconds: 600), vsync: this);
  late Animation sizeAnimation =
      Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
    parent: _animationImageController,
    curve: Curves.bounceOut,
  ));
  final Duration _animationDurationOfText = const Duration(milliseconds: 300);
  final Duration _animationDurationDelay = const Duration(milliseconds: 100);
  late QuantityCubit quantityCubit;

  @override
  void initState() {
    super.initState();
    _animationImageController.forward();
    quantityCubit = context.read<QuantityCubit>();
    quantityCubit.resetQuantity();
  }

  @override
  void dispose() {
    _animationImageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var item = widget.arguments.product;
    return Scaffold(
      body: CustomAppBarAndBody(
        activeBasketButton: true,
        activeBackButton: true,
        backgroundColor: ColorUtils.deepOrange,
        body: Container(
          color: ColorUtils.deepOrange,
          child: Column(
            children: [
              AnimatedBuilder(
                animation: _animationImageController,
                child: Center(
                  child: Image.asset(
                    item.product.image,
                    height: 260.h,
                    width: 300.w,
                    fit: BoxFit.contain,
                  ),
                ),
                builder: (context, widget) => Transform.scale(
                  scale: sizeAnimation.value,
                  child: widget,
                  alignment: const Alignment(0.0, 0.2),
                ),
              ),
              AnimationEaseIn(
                animationDuration: _animationDurationOfText,
                offset: Tween<Offset>(
                    begin: const Offset(0.0, 1.5), end: const Offset(0.0, .05)),
                child: Container(
                  height: MediaQuery.of(context).size.height / 1.8,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: ColorUtils.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.r),
                      topRight: Radius.circular(20.r),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 24,
                      right: 24,
                      bottom: 35,
                    ),
                    child: AnimationEaseIn(
                      animationDuration: _animationDurationOfText,
                      offset: Tween<Offset>(
                          begin: const Offset(0.0, 1.5),
                          end: const Offset(0.0, .05)),
                      delay: _animationDurationOfText,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          DescriptionOfProduct(
                            item: item,
                          ),
                          AnimationEaseIn(
                            animationDuration: _animationDurationOfText,
                            offset: Tween<Offset>(
                                begin: const Offset(0.0, 1.5),
                                end: const Offset(0.0, 0.0)),
                            delay: _animationDurationOfText +
                                _animationDurationDelay,
                            child: const ComboContain(),
                          ),
                          AnimationEaseIn(
                            animationDuration: _animationDurationOfText,
                            offset: Tween<Offset>(
                                begin: const Offset(0.0, 1.5),
                                end: const Offset(0.0, 0.0)),
                            delay: _animationDurationOfText +
                                _animationDurationDelay +
                                _animationDurationDelay,
                            child: Text(
                              AppText.lblIntroduceProduct,
                              style: TextStyleUtils.light(14)
                                  .copyWith(color: Colors.black),
                            ),
                          ),
                          AnimationEaseIn(
                            animationDuration: _animationDurationOfText,
                            offset: Tween<Offset>(
                                begin: const Offset(0.0, 1.5),
                                end: const Offset(0.0, 0.0)),
                            delay: _animationDurationOfText +
                                _animationDurationDelay +
                                _animationDurationDelay,
                            child: Align(
                              alignment: Alignment.center,
                              child: CustomButton(
                                height: 50,
                                minWidth: 200,
                                onPressed: () {
                                  var quantity = quantityCubit.state;
                                  context.read<BasketBloc>().add(
                                        AddBasketItemEvent(
                                          product: item.product,
                                          quantity: quantity,
                                        ),
                                      );
                                  Get.offNamed(MyRouter.myBasketScreen);
                                },
                                child: Text(
                                  AppText.btnAddToBasket,
                                  style: TextStyleUtils.medium(16)
                                      .copyWith(color: ColorUtils.white),
                                ),
                                btnColor: ColorUtils.deepOrange,
                                btnRadius: 10,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
