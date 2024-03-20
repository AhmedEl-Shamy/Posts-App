class Unit {}

class Either<L, R> {
  final L? _left;
  final R? _right;
  const Either({required L? left, required R? right})
      : _right = right,
        _left = left;

  factory Either.right(R right) {
    return Either(left: null, right: right);
  }

  factory Either.left(L left) {
    return Either(left: left, right: null);
  }

  L? get left => _left;
  R? get right => _right;

  void fold({
    required void Function(L left) onLeft,
    required void Function(R right) onRight,
  }) {
    if (_left != null) {
      onLeft(_left);
    } else if (_right != null) {
      onRight(_right);
    }
  }
}
