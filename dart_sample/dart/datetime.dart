void main(List<String> args) {
  print(DateTime(2024, 6, 1)); // 2024-06-01 00:00:00.000
  print(DateTime(2024, 6, 0)); // 2024-05-31 00:00:00.000
  print(DateTime(2024, 6, -1)); // 2024-05-30 00:00:00.000
}
