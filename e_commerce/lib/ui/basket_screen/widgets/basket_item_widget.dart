import 'package:e_commerce/core/blocs/basket_blocs/basket_bloc/basket_bloc.dart';
import 'package:e_commerce/core/ui_models/basket_ui_model.dart';
import 'package:e_commerce/core/utils/color_utils.dart';
import 'package:e_commerce/core/utils/icon_button_util.dart';
import 'package:e_commerce/core/utils/text_style_utils.dart';
import 'package:e_commerce/global/global_data.dart';
import 'package:e_commerce/global/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BasketItemWidget extends StatelessWidget {
  final BasketUIModel item;
  const BasketItemWidget({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 22.h),
      child: SizedBox(
        height: 75.h,
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  Container(
                    height: 65.sp,
                    width: 65.sp,
                    decoration: BoxDecoration(
                      border:
                          Border.all(width: 3.0, color: ColorUtils.transparent),
                      borderRadius: BorderRadius.all(Radius.circular(15.r)),
                      color: item.product.backgroundColor,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(5.r),
                      child: Image.asset(
                        item.product.product.image,
                        height: 40.sp,
                        width: 40.sp,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.product.product.name,
                        style: TextStyleUtils.medium(16)
                            .copyWith(color: ColorUtils.blue),
                      ),
                      Text(
                        item.combo,
                        style: TextStyleUtils.light(12)
                            .copyWith(color: ColorUtils.black),
                      ),
                      Text(
                        locator<GlobalData>().currencySymbol +
                            ' ' +
                            item.product.product.price.toString(),
                        style: TextStyleUtils.medium(16)
                            .copyWith(color: ColorUtils.blue),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButtonUtil(
                    onTap: () {
                      var basketBloc = context.read<BasketBloc>();
                      basketBloc.add(
                        UpdateBasketItemEvent(
                          basketId: item.basketId,
                          quantity: -1,
                        ),
                      );
                    },
                    buttonSize: 32,
                    icon: Icon(
                      Icons.remove,
                      size: 16.sp,
                      color: ColorUtils.deepOrange,
                    ),
                  ),
                  Text(
                    item.quantity.toString(),
                    style: TextStyleUtils.medium(16),
                  ),
                  IconButtonUtil(
                    onTap: () {
                      var basketBloc = context.read<BasketBloc>();
                      basketBloc.add(
                        UpdateBasketItemEvent(
                          basketId: item.basketId,
                          quantity: 1,
                        ),
                      );
                    },
                    buttonSize: 32,
                    icon: Icon(
                      Icons.add,
                      size: 16.sp,
                      color: ColorUtils.deepOrange,
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
