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
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BasketScreen extends StatefulWidget {
  const BasketScreen({super.key});

  @override
  State<BasketScreen> createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  final GlobalKey<AnimatedListState> _key = GlobalKey();
  final basketList = locator<GlobalData>().basketList;
  final _basketUIModelList = <Widget>[];

  @override
  void initState() {
    _loadBasketItem();
    super.initState();
  }

  void _loadBasketItem() {
    var future = Future(() {});
    for (var basketItem in basketList) {
      future = future.then((_) {
        return Future.delayed(const Duration(milliseconds: 100), () {
          _basketUIModelList.add(BasketItem(
            item: basketItem,
          ));
          _key.currentState?.insertItem(_basketUIModelList.length - 1);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomAppbarAndBody(
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
                child: AnimatedList(
                  key: _key,
                  initialItemCount: _basketUIModelList.length,
                  itemBuilder: (context, index, animation) {
                    return SlideTransition(
                      position: CurvedAnimation(
                        curve: Curves.easeOut,
                        parent: animation,
                      ).drive((Tween<Offset>(
                        begin: const Offset(1, 0),
                        end: const Offset(0, 0),
                      ))),
                      child: _basketUIModelList[index],
                    );
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
                        Text(
                          locator<GlobalData>().currencySymboy + ' ' + '60,000',
                          style: TextStyleUtils.medium(24).copyWith(
                            color: ColorUtils.blue,
                          ),
                        ),
                      ],
                    ),
                    CustomButton(
                      onPressed: () {
                        showModalBottomSheet(
                            backgroundColor: ColorUtils.transparent,
                            isScrollControlled: true,
                            context: context,
                            builder: (context) {
                              return const DeliveryDetailWidget();
                            });
                      },
                      child: Text(
                        AppText.btnCheckout,
                        style: TextStyleUtils.medium(16)
                            .copyWith(color: ColorUtils.white),
                      ),
                      btnColor: ColorUtils.deepOrange,
                      btnRadius: 10,
                      height: 56.h,
                      minWidth: 199.w,
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
