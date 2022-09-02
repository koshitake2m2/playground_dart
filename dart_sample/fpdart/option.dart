import 'package:fpdart/fpdart.dart';

void main() {
  final Option<int> some10 = some(10);
  final Option<int> noneInt = none<int>();

  final some20 = some10.map((a) => a * 2);
  print("$some20, $noneInt");

  final match = some10.match((a) => a * 3, () => 0);
  final Either<String, int> v = some10.toEither(() => "nullhelo");
  Option.tryCatch(() => int.parse('hello'));
  final r = right<String, int>(3);
  final l = left<String, int>("left");
  final t = Either.tryCatch(
      () => int.parse('hello'), (o, _) => "$o".replaceAll("\n", ", "));
  print(t);

  print("$r, $l");
}
