void main(List<String> args) async {
  final counter = Counter();

  counter.addListener(() {
    print("\x1B[2J\x1B[0;0H");
    print((List.generate(counter.value, (index) => "=")..add(">")).join());
    //print("${counter.value}%");
  });

  counter.increment();
  await Future.delayed(Duration(seconds: 1));
  counter.increment();
  await Future.delayed(Duration(seconds: 1));
  counter.increment();
  await Future.delayed(Duration(seconds: 1));
  counter.increment();
  await Future.delayed(Duration(seconds: 1));
  counter.increment();
  await Future.delayed(Duration(seconds: 1));

  // for (var i = 0; i <= 99; i++) {
  //   counter.increment();
  //   await Future.delayed(Duration(milliseconds: 50));
  // }
}

class ValueNotifier<T> extends ChangeNotifier implements ValueListenable<T> {
  T _value;
  ValueNotifier(this._value);

  @override
  T get value => _value;

  set value(T newValue) {
    if (_value == newValue) {
      return;
    }
    _value = newValue;
    notifyListeners();
  }
}

class Counter extends ValueNotifier<int> {
  Counter() : super(0);

  increment() => value++;
}

abstract class Listenable {
  void addListener(void Function() listener);
  void removeListener(void Function() listener);
}

abstract class ValueListenable<T> extends Listenable {
  T get value;
}

abstract class ChangeNotifier implements Listenable {
  final _listeners = <void Function()>[];

  @override
  void addListener(void Function() listener) {
    _listeners.add(listener);
  }

  @override
  void removeListener(void Function() listener) {
    _listeners.remove(listener);
  }

  void notifyListeners() {
    for (var listener in _listeners) {
      listener();
    }
  }
}
