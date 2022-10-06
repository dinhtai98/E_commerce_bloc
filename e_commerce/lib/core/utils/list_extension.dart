import 'package:collection/collection.dart' as collection;

extension ListExtension<T> on Iterable<T> {
  Iterable<T> distinct() {
    return toSet().toList();
  }

  bool isNullOrEmpty() {
    // ignore: unnecessary_null_comparison
    return this == null || isEmpty;
  }

  T? firstOrDefault(bool Function(T element) test) {
    return firstWhereOrNull(test);
  }

  Map<S, Iterable<T>> groupBy<S>(S Function(T element) key) {
    return collection.groupBy(this, key);
  }

  double sum(double Function(T element) f) {
    return fold<double>(0.0, (previous, current) => previous + f(current));
  }

  Iterable<T> except(Iterable<T> elements) {
    var result = List<T>.from(this);
    if (elements.isEmpty) return result;

    for (var element in elements) {
      while (result.contains(element)) {
        result.remove(element);
      }

      if (result.isEmpty) {
        break;
      }
    }
    return result;
  }

  Iterable<T> intersect(Iterable<T> elements) {
    var result = <T>[];
    if (elements.isEmpty) return [];

    for (var element in elements) {
      if (contains(element)) {
        result.add(element);
      }
    }
    return result.distinct();
  }

  /// check whether `elements` are the same as current list or not, that means every element of A appears in B
  /// and every element of B appears in A
  bool isEqual(Iterable<T> elements) {
    return every((x) => elements.contains(x)) &&
        elements.every((x) => contains(x));
  }
}
