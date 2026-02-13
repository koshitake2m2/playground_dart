import 'dart:async';

Stream<int> counter() {
  final controller = StreamController<int>();
  int counter = 0;
  Timer.periodic(const Duration(seconds: 1), (timer) {
    controller.add(counter);

    if (counter == 2) {
      controller.addError(Exception('Error'));
    } else if (counter == 3) {
      timer.cancel();
      controller.close();
    }
    counter++;
  });
  return controller.stream;
}

void main(List<String> arguments) {
  Stream<int> stream = counter();

  stream.listen(
    (value) {
      print(value);
    },
    onDone: () {
      print('done');
    },
    onError: (error, stackTrace) {
      print('error: $error');
    },
  );
}
