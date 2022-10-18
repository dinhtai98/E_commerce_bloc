import 'package:equatable/equatable.dart';

class CategoryUIModel extends Equatable {
  final String name;

  const CategoryUIModel({required this.name});

  @override
  List<Object?> get props => [name];
}
