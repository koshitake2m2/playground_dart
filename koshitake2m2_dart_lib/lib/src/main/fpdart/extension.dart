import 'package:fpdart/fpdart.dart';
import 'package:equatable/equatable.dart';

extension EquatableOptionOpt<T extends Equatable> on Option<T> {
  bool contains(T t) => match((value) => value == t, (() => false));
  bool forall(T t) => match((value) => value == t, (() => true));
}
