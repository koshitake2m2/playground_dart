import 'package:test/test.dart';

expectException<E extends Exception>(Function() f) {
  try {
    f();
    expect(true, false);
  } on E {
    expect(true, true);
  } catch (_) {
    expect(true, false);
  }
}
