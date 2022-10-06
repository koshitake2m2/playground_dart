import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

extension NullableOpt<T> on T? {
  S? flatMap<S>(S? Function(T t) onNotNull) {
    final maybeT = this;
    if (maybeT == null) {
      return null;
    } else {
      return onNotNull(maybeT);
    }
  }

  S match<S>(S Function(T t) onNotNull, S Function() onNull) {
    final maybeT = this;
    if (maybeT == null) {
      return onNull();
    } else {
      return onNotNull(maybeT);
    }
  }
}

extension ListOpt<T> on List<T> {
  Option<T> find(bool Function(T) p) => Option.tryCatch(() => firstWhere(p));

  Option<T> findLast(bool Function(T) p) => Option.tryCatch(() => lastWhere(p));

  List<T> combine(List<T> other) => [...this, ...other];
}

extension EquatableListOpt<T extends Equatable> on List<T> {
  bool forall(T t) {
    if (isEmpty) return true;
    return find((p) => p == t).isSome();
  }
}

extension MapOpt<K, V> on Map<K, V> {
  Option<V> apply(K key) => Option.fromNullable(this[key]);

  Option<MapEntry<K, V>> find(bool Function(MapEntry<K, V>) p) {
    return entries.filter(p).firstOption;
  }

  Map<K, V> combine(Map<K, V> other) => {...this, ...other};
}
