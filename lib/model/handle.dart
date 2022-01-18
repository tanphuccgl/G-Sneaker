import 'dart:core';

class XHandle<T> {
  String? message;

  T? _data;

  T? get data => _data;

  Status _status = Status.none;

  bool get isLoading => _status == Status.loading;

  bool get isCompleted => _status == Status.success;

  bool get isError => _status == Status.error;

  XHandle() {
    _status = Status.none;
  }
  XHandle.loading({this.message}) {
    _status = Status.loading;
  }

  XHandle.completed(T data) {
    _data = data;
    message = '';
    _status = Status.success;
  }

  XHandle.error(this.message) {
    _data = null;
    _status = Status.error;
  }
}

enum Status { none, loading, error, success }
