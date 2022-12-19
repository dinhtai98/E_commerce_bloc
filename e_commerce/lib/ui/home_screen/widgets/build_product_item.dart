part of '../home_screen.dart';

class _BuildProductItem extends StatelessWidget {
  final ProductUIModel item;
  const _BuildProductItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(
          MyRouter.productScreen,
          arguments: ProductScreenArguments(product: item),
        );
      },
      child: SizedBox(
        width: 170.w,
        height: 200.h,
        child: Card(
          color: item.backgroundColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: ColorUtils.white,
            ),
            borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
          ),
          elevation: item.elevation,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      item.product.image,
                      height: 80.sp,
                      width: 80.sp,
                    ),
                    Text(
                      item.product.name,
                      style: TextStyleUtils.medium(14)
                          .copyWith(color: ColorUtils.blue),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text: locator<GlobalData>().currencySymbol + ' ',
                              style: TextStyleUtils.medium(14).copyWith(
                                color: ColorUtils.deepOrange,
                              ),
                            ),
                            TextSpan(
                              text: item.product.price.toString(),
                              style: TextStyleUtils.medium(14).copyWith(
                                color: ColorUtils.deepOrange,
                              ),
                            ),
                          ]),
                        ),
                        IconButtonUtil(
                          onTap: () {
                            context
                                .read<BasketBloc>()
                                .add(AddBasketItemEvent(product: item.product));
                          },
                          buttonSize: 24,
                          icon: Icon(
                            Icons.add,
                            size: 12.sp,
                            color: ColorUtils.deepOrange,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 130.w,
                top: 16.h,
                child: IconButtonUtil(
                  onTap: () {
                    //TODO add product to favorite list
                  },
                  buttonSize: 24,
                  icon: Icon(
                    Icons.favorite_border,
                    size: 16.sp,
                    color: ColorUtils.deepOrange,
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
