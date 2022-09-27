import 'package:test/test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:koshitake2m2_dart_lib/src/test/test_extension.dart';
import 'package:koshitake2m2_dart_lib/test_lib.dart';

class FpdartExtensionException implements Exception {
  final String _s;

  FpdartExtensionException(String message) : _s = message;

  @override
  String toString() => "FpdartExtensionException: '$_s'";
}

extension OptionOpt<T> on Option<T> {
  T get unwrap => match(
        (r) => r,
        () => throw FpdartExtensionException("Can't unwrap"),
      );
}

extension EitherOpt<L, R> on Either<L, R> {
  R get unwrap => match(
      (l) => throw FpdartExtensionException("Can't unwrap: $l"), (r) => r);
}

void main() {
  group('OptionOpt', () {
    group('#unwrap', () {
      test('returns raw value if some', () {
        expect(Some(10).unwrap, 10);
      });

      test('throws exception if none', () {
        expectException<FpdartExtensionException>(() => None<int>().unwrap);
      });
    });
  });
}
