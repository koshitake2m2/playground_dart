import 'package:test/test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:koshitake2m2_dart_lib/test_lib.dart';

import '../../../fixture/fixture.dart';

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

  group('EquatableListOpt', () {
    final user1 = User(1, "koshi");
    final user2 = User(2, "take");
    final users = [user1, user2];
    group('#forall', () {
      test('returns true if element is found', () {
        final target = User(1, "koshi");
        expect(users.forall(target), true);
      });

      test('returns false if element is not found', () {
        final target = User(3, "hello");
        expect(users.forall(target), false);
      });

      test('returns true if list is empty', () {
        @override
        final users = List<User>.empty();
        final target = User(1, "koshi");
        expect(users.forall(target), true);
      });
    });
  });

  group('MapOpt', () {
    group('#find', () {
      test('returns Some(element) if element is found', () {
        final m = Map<String, int>.from({"a": 1, "b": 2});
        final me = m.find((p) => p.key == "a" && p.value == 1).unwrap;
        expect(me.key == "a" && me.value == 1, true);
      });

      test('returns None if element is not found', () {
        final m = Map<String, int>.from({"a": 1, "b": 2});
        expect(m.find((p) => p.key == "a" && p.value == 1000), None());
      });

      test('returns None if list is empty', () {
        final m = <String, int>{};
        expect(m.find((p) => p.key == "a" && p.value == 1), None());
      });
    });
  });
}
