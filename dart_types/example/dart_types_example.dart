import 'package:dart_types/dart_types.dart';

void main() {
  final result = divide(10, 2);
  if (result.isOk()) {
    print(result.unwrap());
  }

  final result2 = divide(10, 0);
  if (result2.isErr()) {
    print(result2.unwrapError().error());
  }
}

Result<int> divide(int a, int b) {
  if (b == 0) {
    return Result.error(Err("Division by zero"));
  }
  return Result(a ~/ b);
}
