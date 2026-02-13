void main(List<String> arguments) {
  Stream<int> stream = Stream.periodic(
    const Duration(seconds: 1),
    (i) => i * i,
  ).asBroadcastStream();

  stream.listen((value) {
    print('listener 1: $value');
  });

  stream.listen((value) async {
    await Future.delayed(const Duration(milliseconds: 500));
    print('listener 2: $value');
  });
}
