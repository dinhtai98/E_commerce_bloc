part of '../home_screen.dart';

class _BuildListOfProduct extends StatelessWidget {
  final List<ProductUIModel> products;
  final Duration animationDurationOfProductList;
  const _BuildListOfProduct({
    Key? key,
    required this.products,
    required this.animationDurationOfProductList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationEaseIn(
      offset: Tween<Offset>(
          begin: const Offset(0.2, 0.0), end: const Offset(0.0, 0.0)),
      animationDuration: animationDurationOfProductList,
      child: SizedBox(
        height: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: products.length,
          itemBuilder: (context, index) {
            return _BuildProductItem(item: products[index]);
          },
        ),
      ),
    );
  }
}
