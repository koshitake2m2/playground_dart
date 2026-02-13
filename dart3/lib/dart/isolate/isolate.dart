import 'dart:isolate';

Future<void> main(List<String> arguments) async {
  print('main is started');
  Isolate.run(() async {
    await Future.delayed(const Duration(seconds: 1));
    return 10;
  }).then((value) {
    print('result: $value');
  });
  print('main is done');
}
