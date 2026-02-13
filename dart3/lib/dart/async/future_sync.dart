int process() {
  throw Exception('Error');
}

Future<int> fetchData() {
  // To catch the error, we can use Future.sync.
  // process();
  return Future.sync(() {
    process();
    return Future.delayed(const Duration(milliseconds: 500));
  });
}

Future<int> fetchData2() async {
  // If you use async/await, you can also catch the error.
  process();
  return Future.delayed(const Duration(milliseconds: 500));
}

void main(List<String> arguments) {
  print('start');
  fetchData()
      // fetchData2()
      .then((value) {
        print('result: $value');
      })
      .onError((error, stackTrace) {
        print('error: $error');
      });
}
