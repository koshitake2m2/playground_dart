Future<int> getNumber() async {
  await Future.delayed(const Duration(milliseconds: 300));
  return 10;
}

Future<String> getString() async {
  await Future.delayed(const Duration(milliseconds: 600));
  return 'Hello';
}

Future<int> getError() async {
  await Future.delayed(const Duration(milliseconds: 900));
  throw Exception('Error');
}

void main(List<String> arguments) async {
  try {
    final results = await [getNumber(), getString(), getError()].wait;
    print('results: $results');
  } on ParallelWaitError<List<dynamic>, List<dynamic>> catch (e) {
    print('values: ${e.values}');
    print('errors: ${e.errors}');
  }
}
