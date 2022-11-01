import 'package:dart_sample/src/user/user.dart';
import 'package:fpdart/fpdart.dart';

class OnMemoryUserRepository {
  final List<User> _values;

  OnMemoryUserRepository(this._values);

  Future<Option<User>> findById(String id) async =>
      Option.tryCatch(() => _values.firstWhere((element) => element.id == id));

  Future<List<User>> findAll() async => _values;

  Stream<List<User>> findAllStream() {
    return Stream<List<User>>.value(_values);
  }

  Future<void> store(User user) async {
    _values.add(user);
  }

  Future<void> update(User user) async {
    _values.removeWhere((element) => element.id == user.id);
    _values.add(user);
  }

  Future<void> deleteById(String id) async {
    _values.removeWhere((element) => element.id == id);
  }

  static List<User> fixtures() => [
        User.of("0", "A", "a"),
        User.of("1", "B", "b"),
        User.of("2", "C", "c"),
        User.of("0", "D", "d"),
      ].foldLeft([], ((b, t) => t.match((l) => b, (r) => (b..add(r)))));
}
