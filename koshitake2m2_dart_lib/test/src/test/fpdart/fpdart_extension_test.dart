import 'package:test/test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:koshitake2m2_dart_lib/test_lib.dart';

void main() {
  group('UnsafeOptionOpt', () {
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
