import 'package:fpdart/fpdart.dart';

class FpdartExtensionException implements Exception {
  final String _s;

  FpdartExtensionException(String message) : _s = message;

  @override
  String toString() => "FpdartExtensionException: '$_s'";
}


extension OptionOpt<T> on Option<T> {
  T get unwrap =>
      match(
            (r) => r,
            () => throw FpdartExtensionException("Can't unwrap"),
      );
}

extension EitherOpt<L, R> on Either<L, R> {
  R get unwrap =>
      match((l) => throw FpdartExtensionException("Can't unwrap: $l"), (
          r) => r);
}
