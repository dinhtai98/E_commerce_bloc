part of '../home_screen.dart';

class _BuilCategory extends StatelessWidget {
  const _BuilCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var categoryBloc = context.read<HomeCategoryBloc>();
    categoryBloc.add(const CategoryInitEvent());
    return SizedBox(
      height: 40.h,
      child: BlocSelector<HomeCategoryBloc, HomeCategoryBlocState,
          List<CategoryUIModel>>(
        selector: (state) {
          return state.categories;
        },
        builder: (context, state) {
          if (state.isNotEmpty) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.length,
              itemBuilder: (context, index) {
                return _CategoryWidget(
                  category: state[index],
                );
              },
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}

class _CategoryWidget extends StatelessWidget {
  final CategoryUIModel category;
  const _CategoryWidget({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var categoryBloc = context.read<HomeCategoryBloc>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: InkWell(
        onTap: () {
          categoryBloc.add(CategorySelectedEvent(category: category));
        },
        child: BlocSelector<HomeCategoryBloc, HomeCategoryBlocState,
            CategoryUIModel?>(
          selector: (state) {
            return state.categorySelected;
          },
          builder: (context, state) {
            var active = category == state;
            return Container(
              constraints: const BoxConstraints(
                minWidth: 50.0,
              ),
              decoration: BoxDecoration(
                gradient: active
                    ? const LinearGradient(
                        colors: [
                          Color(0xffA40303),
                          Color(0xffD30606),
                        ],
                      )
                    : const LinearGradient(
                        colors: [
                          Color(0xffEDEDED),
                          Color(0xffEDEDED),
                        ],
                      ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    category.name,
                    maxLines: 1,
                    style: TextStyleUtils.regular(14)
                        .copyWith(color: active ? Colors.white : Colors.black),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
