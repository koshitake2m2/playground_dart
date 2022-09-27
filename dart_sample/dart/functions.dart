void main(List<String> args) {
  // function declaration
  int Function(int) f = (int a) => a * 2;
  int Function(int) g = (int a) {
    return a + 2;
  };
  h(int a) => a + 3;
  int j(int a) => a + 3;

  print(f(g(h(1))));
}
