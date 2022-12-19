part of '../product_screen.dart';

class DescriptionOfProduct extends StatelessWidget {
  final ProductUIModel item;
  const DescriptionOfProduct({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            item.product.name,
            style: TextStyleUtils.medium(24).copyWith(
              color: ColorUtils.blue,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _BuildQuantityGroupButton(item: item),
              Text(
                locator<GlobalData>().currencySymbol +
                    ' ' +
                    item.product.price.toString(),
                style:
                    TextStyleUtils.medium(24).copyWith(color: ColorUtils.blue),
              )
            ],
          ),
          const Divider(thickness: 2, height: 1),
        ],
      ),
    );
  }
}

class _BuildQuantityGroupButton extends StatelessWidget {
  final ProductUIModel item;
  const _BuildQuantityGroupButton({required this.item});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButtonUtil(
            onTap: () {
              context.read<QuantityCubit>().decrement();
            },
            buttonSize: 32,
            icon: Icon(
              Icons.remove,
              size: 16.sp,
              color: ColorUtils.deepOrange,
            ),
          ),
          BlocBuilder<QuantityCubit, int>(
            builder: (context, state) {
              return Text(
                '$state',
                style: TextStyleUtils.regular(24).copyWith(
                  color: ColorUtils.blue,
                ),
              );
            },
          ),
          IconButtonUtil(
            onTap: () {
              context.read<QuantityCubit>().increment();
            },
            buttonSize: 32,
            icon: Icon(
              Icons.add,
              size: 16.sp,
              color: ColorUtils.deepOrange,
            ),
          )
        ],
      ),
    );
  }
}
