// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// SealedClassGenerator
// **************************************************************************

class SealedResult<T> {
  R when<R>(
    R Function(Success<T>) success,
    R Function(Failure<T>) failure,
    R Function(Idle<T>) idle,
  ) {
    if (this is Success<T>) {
      return success(this as Success<T>);
    }
    if (this is Failure<T>) {
      return failure(this as Failure<T>);
    }
    if (this is Idle<T>) {
      return idle(this as Idle<T>);
    }
    throw new Exception(
        'If you got here, probably you forgot to regenerate the classes? Try running flutter packages pub run build_runner build');
  }
}
