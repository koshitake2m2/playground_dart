import 'package:test/test.dart';
import 'package:dart_sample/myfp.dart';
import '../mytest_lib.dart';

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
