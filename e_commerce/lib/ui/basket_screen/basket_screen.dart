import 'package:e_commerce/core/blocs/basket_blocs/basket_bloc/basket_bloc.dart';
import 'package:e_commerce/core/blocs/home_blocs/product_bloc/product_bloc.dart';
import 'package:e_commerce/core/ui_models/product_ui_model.dart';
import 'package:e_commerce/core/utils/color_utils.dart';
import 'package:e_commerce/core/utils/custom_button.dart';
import 'package:e_commerce/core/utils/text_style_utils.dart';
import 'package:e_commerce/global/app_text.dart';
import 'package:e_commerce/global/global_data.dart';
import 'package:e_commerce/global/locator.dart';
import 'package:e_commerce/ui/basket_screen/widgets/basket_item_widget.dart';
import 'package:e_commerce/ui/common_widgets/appbar.dart';
import 'package:e_commerce/ui/delivery_details_screen/delivery_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BasketScreen extends StatefulWidget {
  const BasketScreen({super.key});

  @override
  State<BasketScreen> createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  late BasketBloc basketBloc;
  late ProductBloc productBloc;
  late List<ProductUIModel> productUiModel;

  @override
  void initState() {
    basketBloc = context.read<BasketBloc>();
    productBloc = context.read<ProductBloc>();
    basketBloc.add(const BasketInitEvent());
    productUiModel = productBloc.state.listOfProduct;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomAppBarAndBody(
        backgroundColor: ColorUtils.deepOrange,
        activeBasketButton: false,
        activeBackButton: true,
        title: Text(
          AppText.lblMyBasket,
          style: TextStyleUtils.medium(24).copyWith(color: ColorUtils.white),
        ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: BlocBuilder<BasketBloc, BasketState>(
                  buildWhen: (previous, current) =>
                      current is BasketLoadedState,
                  builder: (context, state) {
                    if (state is BasketLoadedState &&
                        state.basketItems.isNotEmpty) {
                      return ListView.builder(
                        itemCount: state.basketItems.length,
                        itemBuilder: (context, index) {
                          var basketItem = state.basketItems[index]
                              .toUIModel(productUiModel);
                          return BasketItemWidget(
                            item: basketItem,
                          );
                        },
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
            ),
            Container(
              color: ColorUtils.grey10,
              height: 166.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppText.lblTotal,
                          style: TextStyleUtils.light(14).copyWith(
                            color: ColorUtils.black,
                          ),
                        ),
                        BlocSelector<BasketBloc, BasketState, double>(
                          selector: (state) {
                            if (state is BasketLoadedState) {
                              return state.totalPrice;
                            }
                            return 0;
                          },
                          builder: (context, totalPrice) {
                            return Text(
                              locator<GlobalData>().currencySymbol +
                                  ' ' +
                                  ' $totalPrice',
                              style: TextStyleUtils.medium(24).copyWith(
                                color: ColorUtils.blue,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    BlocBuilder<BasketBloc, BasketState>(
                      builder: (context, state) {
                        if (state is BasketLoadedState) {
                          var disableCheckout = state.basketItems.isEmpty;
                          return CustomButton(
                            disabledColor: ColorUtils.lightOrange,
                            onPressed: disableCheckout
                                ? null
                                : () {
                                    showModalBottomSheet(
                                      backgroundColor: ColorUtils.transparent,
                                      isScrollControlled: true,
                                      context: context,
                                      builder: (context) {
                                        return const DeliveryDetailWidget();
                                      },
                                    );
                                  },
                            child: Text(
                              AppText.btnCheckout,
                              style: TextStyleUtils.medium(16).copyWith(
                                  color: disableCheckout
                                      ? ColorUtils.grey
                                      : ColorUtils.white),
                            ),
                            btnColor: ColorUtils.deepOrange,
                            btnRadius: 10,
                            height: 56.h,
                            minWidth: 199.w,
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
