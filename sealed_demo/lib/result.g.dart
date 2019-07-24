// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// SealedClassGenerator
// **************************************************************************

class ResultSealed {
  R when<R>(
    R Function(Success) success,
    R Function(Failure) failure,
    R Function(Idle) idle,
  ) {
    if (this is Success) {
      return success(this as Success);
    }
    if (this is Failure) {
      return failure(this as Failure);
    }
    if (this is Idle) {
      return idle(this as Idle);
    }
    throw new Exception(
        'If you got here, probably you forgot to regenerate the classes? Try running flutter packages pub run build_runner build');
  }
}
