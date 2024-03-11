class Unit {}

class Either<E, T> {
  final E? _error;
  final T? _data;
  Either({required E? left, required T? right})
      : _data = right,
        _error = left;

  E? get error => _error;
  T? get data => _data;

  void fold({
    required void Function(E error) errorFunction,
    required void Function(T data) successFunction,
  }) {
    if (_error != null) {
      errorFunction(_error);
    } else if (_data != null) {
      successFunction(_data);
    }
  }
}
