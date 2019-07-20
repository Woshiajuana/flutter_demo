
import 'package:meta/meta.dart';

// State中所有属性都应该是只读的
@immutable
class CountState {
  final int _count;
  get count => _count;

  CountState(this._count);

  CountState.initState() : _count = 0;
}


enum Actionxx { xxxx }


CountState reducer(CountState state, action) {
  //匹配Action
  if (action == Actionxx.xxxx) {
    return CountState(state.count + 1);
  }
  return state;
}