ᶘ ᵒᴥᵒᶅ 

### SealedCodegen - 'when' operator generator for @sealed classes ###

# Getting started #

1) Add these dependencies
```yaml
dev_dependencies:
  build_runner: ^1.0.0
  sealed_generator: 0.0.2
```

2) Mark any class you want with @sealed annotation (meta: ^1.1.7) and add part '<filename>.g.dart' to the header of you file

```dart
import 'package:meta/meta.dart';

part 'result.g.dart';

@sealed
class Result<T> with SealedResult<T> {}

class Success<T> extends Result<T> {
  T value;

  Success(this.value);
}
```
3) run: 
```bash
flutter packages pub run build_runner build
```
Generator will create a class SealedOriginalClassName for you to use 

```dart
class SealedResult<T> {
  R when<R>(
    R Function(Success<T>) success,
    R Function(Failure<T>) failure,
  ) {
    if (this is Success<T>) {
      return success(this as Success<T>);
    }
    if (this is Failure<T>) {
      return failure(this as Failure<T>);
    }
    throw new Exception(
        'If you got here, probably you forgot to regenerate the classes? Try running flutter packages pub run build_runner build');
  }
}
```

4) Add with(or extends) to your sealed class, for e.g. class Result extends(with) ResultSealed

# Using #

Just create an instance of you sealed class and call when on it, for example: 

```dart
  var resultWidget = Success("hello from success").when(
            (success) => Text(success.value),
            (failure) => Text("Failure"), 
            (idle) => Text("idle")
    );
```

And that's it, you are ready to use sealed classses with some sort of when 

It is a very early version of the library, mostly a proof of concept, so contributions are highly welcomed
