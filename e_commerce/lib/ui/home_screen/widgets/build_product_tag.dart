part of '../home_screen.dart';

class _BuildProductTag extends StatelessWidget {
  const _BuildProductTag({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ProductBloc, ProductBlocState, List<ProductTag>>(
      selector: (state) {
        return state.listOfProductTag;
      },
      builder: (context, state) {
        if (state.isEmpty) {
          return const SizedBox.shrink();
        }
        return SizedBox(
          height: 50.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.length,
            itemBuilder: (context, index) {
              return _BuildProductTagItem(tag: state[index]);
            },
          ),
        );
      },
    );
  }
}

class _BuildProductTagItem extends StatelessWidget {
  final ProductTag tag;
  const _BuildProductTagItem({Key? key, required this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: InkWell(
        onTap: () {
          context
              .read<ProductBloc>()
              .add(ProductTagSelectedEvent(tagSelected: tag));
        },
        child: BlocSelector<ProductBloc, ProductBlocState, ProductTag?>(
          selector: (state) {
            return state.tagSelected;
          },
          builder: (context, state) {
            var activeUnderline = state == tag;
            return TextUnderLine(
              title: tag.name,
              activeUnderline: activeUnderline,
            );
          },
        ),
      ),
    );
  }
}
