void main(List<String> arguments) {
  Stream<int> stream = Stream.periodic(
    const Duration(seconds: 1),
    (i) => i * i,
  );

  stream.listen((value) {
    print(value);
  });

  print('main is done. The stream is processing...');
}
