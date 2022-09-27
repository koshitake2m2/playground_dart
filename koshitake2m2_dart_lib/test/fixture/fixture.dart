import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String name;

  User(this.id, this.name);

  @override
  List<Object?> get props => [id, name];
}
