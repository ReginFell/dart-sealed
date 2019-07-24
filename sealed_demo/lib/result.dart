import 'package:meta/meta.dart';

part 'result.g.dart';

@sealed
class Result<T> extends SealedResult<T> {}

class Success<T> extends Result<T> {
  T value;

  Success(this.value);
}

class Failure<T> extends Result<T> {}

class Idle<T> extends Result<T> {}
