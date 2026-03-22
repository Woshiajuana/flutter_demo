main() {
  print('111');

  int a = 10;
  int b = 2;
  int c = a ~/ b;

  var d = 2.2 % 2;

  print(d);

  var arr = [1, 2].map((e) => e + 1);
  // arr.addAll(arr.)

  var f1 = add;

  for (var item in arr) {
    print('item => $item');
  }

  var s = Set<int>();

  var m = {
    'name': '1',
  };

  m['xx'] = '1';

  var m2 = Map();
  var mm = m.map((key, value) => MapEntry(key, value));
  m2.addEntries(m.entries.map((e) => MapEntry(e.key, e.value)).toList());

  print('m => $m');
  print('m2 => $m2');
}

typedef Add = int Function(int, int);

int add(int a, int b) {
  return a + b;
}

add1(int a, int b) {
  return a + b;
}
