import 'package:fpdart/fpdart.dart';

extension ListOpt<T> on List<T> {
  Option<T> find(bool Function(T) p) => Option.tryCatch(() => firstWhere(p));

  Option<T> findLast(bool Function(T) p) => Option.tryCatch(() => lastWhere(p));
}
