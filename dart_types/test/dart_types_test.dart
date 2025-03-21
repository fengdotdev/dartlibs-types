import 'package:dart_types/dart_types.dart';
import 'package:test/test.dart';

void main() {
  group('Result', () {
   Result<int> divide(int a, int b) {
      if (b == 0) {
        return Result.error(Err("Division by zero"));
      }
      return Result(a ~/ b);
    }

    test('isOk', () {
      final result = divide(10, 2);
      expect(result.isOk(), isTrue);
      expect(result.isErr(), isFalse);
    });

    test('isErr if division by zero', () {
      final result = divide(10, 0);
      expect(result.isOk(), isFalse);
      expect(result.isErr(), isTrue);
    });

    test('unwrap returns data when ok', () {
      final result = divide(6, 2);
      expect(result.unwrap(), equals(3));
    });

    test('unwrapError returns error when err', () {
      final result = divide(5, 0);
      expect(result.isErr(), isTrue);
      expect(result.unwrapError().error(), equals("Division by zero"));
    });
  });

  group('Err', () {
    test('contains correct error message', () {
      final err = Err("Sample error");
      expect(err.error(), equals("Sample error"));
    });
  });
}
