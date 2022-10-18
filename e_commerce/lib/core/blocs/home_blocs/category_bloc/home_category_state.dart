part of 'home_category_bloc.dart';

abstract class HomeCategoryBlocState extends Equatable {
  final List<CategoryUIModel> categories;
  final CategoryUIModel? categorySelected;
  const HomeCategoryBlocState(
      {required this.categories, this.categorySelected});

  @override
  List<Object?> get props => [categories, categorySelected];
}

class HomeCategoryBlocInitial extends HomeCategoryBlocState {
  HomeCategoryBlocInitial() : super(categories: [], categorySelected: null);
}

class HomeCategoryBlocStateLoaded extends HomeCategoryBlocState {
  const HomeCategoryBlocStateLoaded({required List<CategoryUIModel> categories})
      : super(categories: categories);
}

class CategorySelectedState extends HomeCategoryBlocState {
  final CategoryUIModel category;
  final List<CategoryUIModel> listOfCategory;
  const CategorySelectedState(
      {required this.category, required this.listOfCategory})
      : super(categorySelected: category, categories: listOfCategory);
}
