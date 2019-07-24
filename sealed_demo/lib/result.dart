import 'package:meta/meta.dart';

part 'result.g.dart';

@sealed
class Result<T> extends ResultSealed {}

class Success<T> extends Result<T> {
  T value;

  Success(this.value);
}

class Failure extends Result {}

class Idle extends Result {}
