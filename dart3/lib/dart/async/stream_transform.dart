import 'dart:async';

int mul2(int value) => value * 2;
int mul3(int value) => value * 3;

void main(List<String> arguments) {
  Stream<int> stream = Stream.periodic(const Duration(seconds: 1), (i) => i);

  stream
      .transform(
        StreamTransformer.fromHandlers(
          handleData: (value, sink) {
            sink.add(mul2(value));
            sink.add(mul3(value));

            if (value == 2) {
              sink.addError('Error');
            }
            if (value == 3) {
              sink.close();
            }
          },
        ),
      )
      .listen(
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
