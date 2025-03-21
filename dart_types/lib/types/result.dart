
import 'package:dart_types/interfaces/error_interface.dart';
import 'package:dart_types/interfaces/result_interface.dart';



class Result<T>  implements ResultInterface<T, ErrorInterface> {
  final T? data;
  final ErrorInterface? error;

  Result(this.data) : error = null;
  Result.error(this.error) : data = null;

  @override
  T unwrapOr(T or) {
    if (data == null) {
      return or;
    }
    return data!;
  }


  @override
  T unwrap() {
    if (data == null) {
      throw Exception("Data is null");
    }
    return data!;
  }

  @override
  bool isOk() {
    return data != null;
  }


  @override
  bool isErr() {
    return data == null;
  }


  @override
  ErrorInterface unwrapError() {
    if (error == null) {
      throw Exception("Error is null");
    }
    return error!;
  }


}