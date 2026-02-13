Stream<int> sumStream(Stream<int> stream) async* {
  var sum = 0;
  await for (final value in stream) {
    yield sum += value;
  }
}

void main(List<String> arguments) {
  Stream<int> stream = Stream.periodic(const Duration(seconds: 1), (i) => i);

  sumStream(stream).listen((value) {
    print(value);
  });
}
