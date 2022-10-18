import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/ui_models/category_ui_model.dart';
import 'package:equatable/equatable.dart';

part 'home_category_event.dart';
part 'home_category_state.dart';

class HomeCategoryBloc
    extends Bloc<HomeCategoryBlocEvent, HomeCategoryBlocState> {
  final List<CategoryUIModel> categories = [
    const CategoryUIModel(name: 'All'),
    const CategoryUIModel(name: 'Salad Combo'),
    const CategoryUIModel(name: 'Berry Combo'),
    const CategoryUIModel(name: 'Mango Combo'),
  ];
  HomeCategoryBloc() : super(HomeCategoryBlocInitial()) {
    on<CategoryInitEvent>(
      (event, emit) {
        emit(
          HomeCategoryBlocStateLoaded(
            categories: categories,
          ),
        );
      },
    );

    on<CategorySelectedEvent>(
      (event, emit) {
        emit(
          CategorySelectedState(
            category: event.category,
            listOfCategory: categories,
          ),
        );
      },
    );
  }
}
