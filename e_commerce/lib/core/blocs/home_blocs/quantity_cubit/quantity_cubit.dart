import 'package:bloc/bloc.dart';

class QuantityCubit extends Cubit<int> {
  QuantityCubit() : super(1);
  void resetQuantity() => emit(1);
  void increment() => emit(state + 1);
  void decrement() {
    if (state <= 1) return;
    emit(state - 1);
  }
}
