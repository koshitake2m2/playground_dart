import 'package:dart_sample/src/user/first_name.dart';
import 'package:dart_sample/src/user/last_name.dart';
import 'package:fpdart/fpdart.dart';

class User {
  final String id;
  final FirstName firstName;
  final LastName lastName;

  // User(this.firstName, this.lastName);
  User._(this.id, this.firstName, this.lastName);

  static Either<String, User> of(
      String id, String rawFirstName, String rawLastName) {
    if (10 < rawFirstName.length) return Left("first name is too long");
    if (10 < rawLastName.length) return Left("last name is too long");
    return Right(User._(id, FirstName(rawFirstName), LastName(rawLastName)));
  }

  String fullName() => "${firstName.value} ${lastName.value}";
}
