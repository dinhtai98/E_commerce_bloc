// ignore_for_file: avoid_print

import 'package:e_commerce/core/blocs/home_blocs/category_bloc/home_category_bloc.dart';
import 'package:e_commerce/core/blocs/home_blocs/product_bloc/product_bloc.dart';
import 'package:e_commerce/core/database/entities/product_tags/product_tag_entity.dart';
import 'package:e_commerce/core/ui_models/category_ui_model.dart';
import 'package:e_commerce/core/ui_models/product_ui_model.dart';
import 'package:e_commerce/core/utils/animation_ease_in.dart';
import 'package:e_commerce/core/utils/color_utils.dart';
import 'package:e_commerce/core/utils/text_style_utils.dart';
import 'package:e_commerce/core/utils/text_underliner.dart';
import 'package:e_commerce/global/app_text.dart';
import 'package:e_commerce/global/custom_input_field.dart';
import 'package:e_commerce/ui/common_widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part 'widgets/build_category.dart';
part 'widgets/build_list_of_product.dart';
part 'widgets/build_product_item.dart';
part 'widgets/build_product_tag.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  final Duration animationDurationOfProductList =
      const Duration(milliseconds: 300);

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    context.read<ProductBloc>().add(const ProductInitEvent());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              leading: IconButton(
                icon: Image.asset('assets/images/menu.png'),
                iconSize: 20,
                onPressed: () {},
              ),
              title: Text(
                AppText.lblWelcome + " Chris" + '.',
                style: TextStyleUtils.regular(14).copyWith(
                  color: ColorUtils.blue,
                ),
              ),
              activeBasketButton: true,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: SizedBox(
                height: 56.h,
                child: Row(
                  children: [
                    Expanded(
                      child: CustomTextInputField(
                        controller: _controller,
                        hintText: AppText.lblSearchForFruitSaladCombos,
                        hintStyle: TextStyleUtils.medium(12)
                            .copyWith(color: ColorUtils.grey70),
                        prefixIcon: Icon(
                          Icons.search,
                          size: 20.sp,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        //TODO
                      },
                      icon: Image.asset(
                        'assets/images/fillter.png',
                        height: 55.h,
                        width: 35.w,
                      ),
                      iconSize: 10.sp,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 22.h),
            Padding(
              padding: EdgeInsets.only(left: 15.w),
              child: const _BuilCategory(),
            ),
            SizedBox(height: 12.h),
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 24.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20.h),
                        const TextUnderLine(title: AppText.lblRecommendedCombo),
                        BlocSelector<ProductBloc, ProductBlocState,
                            List<ProductUIModel>>(
                          selector: (state) {
                            return state.listOfProductRecommended;
                          },
                          builder: (context, state) {
                            print("rebuild listOfProductRecommended");
                            if (state.isEmpty) {
                              return const SizedBox.shrink();
                            }
                            return _BuildListOfProduct(
                              products: state,
                              animationDurationOfProductList:
                                  animationDurationOfProductList,
                            );
                          },
                        ),
                        SizedBox(height: 40.h),
                        const _BuildProductTag(),
                        BlocSelector<ProductBloc, ProductBlocState,
                            List<ProductUIModel>>(
                          selector: (state) {
                            return state.listOfProduct;
                          },
                          builder: (context, state) {
                            print("rebuild listOfProduct");
                            if (state.isEmpty) {
                              return const SizedBox.shrink();
                            }
                            return _BuildListOfProduct(
                              products: state,
                              animationDurationOfProductList:
                                  animationDurationOfProductList,
                            );
                          },
                        ),
                        SizedBox(height: 20.h),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
