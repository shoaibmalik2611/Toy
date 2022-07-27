import 'package:flutter_task/enums/response_status.dart';

class ApiResponse<T> {
  ResponseStatus status;
  T? data;
  String? message;

  ApiResponse.loading() : status = ResponseStatus.loading;

  ApiResponse.completed(this.data) : status = ResponseStatus.complete;

  ApiResponse.error(this.message) : status = ResponseStatus.error;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}
