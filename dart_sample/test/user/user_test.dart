import 'package:dart_sample/dart_sample.dart';
import 'package:test/test.dart';
import 'package:dart_sample/myfp.dart';

void main() {
  group('User', () {
    print(User.of("hello", "world"));
    final User user = User.of("hello", "world").unwrap;

    group('#fullName', () {
      test('returns fullName', () {
        expect(user.fullName(), "hello world");
      });
    });
  });
}
