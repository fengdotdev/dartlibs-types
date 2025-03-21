abstract class ResultInterface<T, ErrorInterface> {
  T unwrap();
  ErrorInterface unwrapError();
  T unwrapOr(T or);
  bool isOk();
  bool isErr();
}
