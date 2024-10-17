class DataState<T> {
  T data;

  DataState({
    required this.data,
  });
}

class Success<T> extends DataState<T> {
  Success({required super.data});
}

class Failure<T> extends DataState<T> {
  Failure({
    required super.data,
  });
}
