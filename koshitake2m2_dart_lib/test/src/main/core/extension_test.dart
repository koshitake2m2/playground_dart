import 'package:test/test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:koshitake2m2_dart_lib/test_lib.dart';

void main() {
  group('ListOpt', () {
    group('#find', () {
      test('returns Some(element) if element is found', () {
        final list = [1, 2, 3];
        expect(list.find((p) => p == 2), Some(2));
      });

      test('returns None if element is not found', () {
        final list = [1, 3];
        expect(list.find((p) => p == 2), None());
      });

      test('returns None if list is empty', () {
        final list = List<int>.empty();
        expect(list.find((p) => p == 2), None());
      });
    });
  });
}
