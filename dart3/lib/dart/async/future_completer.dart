import 'dart:async';
import 'dart:math';

Future<String> fetchData() {
  final completer = Completer<String>();

  Timer(const Duration(milliseconds: 500), () {
    if (Random().nextBool()) {
      completer.complete("Success");
    } else {
      completer.completeError(Exception("Error"));
    }
  });

  return completer.future;
}

void main(List<String> arguments) async {
  print('start');
  await fetchData()
      .then((value) {
        print('value: $value');
      })
      .onError((error, stackTrace) {
        print('error: $error');
      })
      .whenComplete(() {
        print('whenComplete');
      });
  print('end');
}
