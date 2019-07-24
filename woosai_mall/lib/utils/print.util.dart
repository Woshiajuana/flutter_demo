

class Print {

  static final Print _print = Print._internal();

  factory Print () {
    return _print;
  }

  Print._internal();

}