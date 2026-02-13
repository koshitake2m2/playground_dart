Future<int> getNumber() async {
  await Future.delayed(const Duration(seconds: 1));
  return 10;
}

Future<String> getString() async {
  await Future.delayed(const Duration(seconds: 2));
  return 'Hello';
}

void main(List<String> arguments) async {
  await Future.wait([getNumber(), getString()]).then((List<Object> values) {
    int num = values[0] as int;
    String str = values[1] as String;
    print('num: $num, str: $str');
  });
}
