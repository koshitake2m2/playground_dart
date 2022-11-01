import 'package:dart_sample/dart_sample.dart';
import 'package:test/test.dart';
import 'package:koshitake2m2_dart_lib/test_lib.dart';

void main() {
  group('User', () {
    print(User.of("0", "hello", "world"));
    final User user = User.of("0", "hello", "world").unwrap;

    group('#fullName', () {
      test('returns fullName', () {
        expect(user.fullName(), "hello world");
      });
    });
  });
}
