


import 'package:dart_types/interfaces/error_interface.dart';

class Err implements ErrorInterface {
  final String _error;
  Err(this._error);

  @override
  String error() {
    return _error;
  }
}