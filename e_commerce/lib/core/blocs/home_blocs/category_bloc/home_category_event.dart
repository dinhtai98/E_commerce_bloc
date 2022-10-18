part of 'home_category_bloc.dart';

abstract class HomeCategoryBlocEvent extends Equatable {
  const HomeCategoryBlocEvent();

  @override
  List<Object> get props => [];
}

class CategoryInitEvent extends HomeCategoryBlocEvent {
  const CategoryInitEvent();
}

class CategorySelectedEvent extends HomeCategoryBlocEvent {
  final CategoryUIModel category;
  const CategorySelectedEvent({required this.category});
}
