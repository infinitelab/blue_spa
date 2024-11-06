class ResponseModel<T> {
  final bool success;
  String? message;
  T? data;
  ResponseModel.success(this.data, {this.message}) : success = true;
  ResponseModel.error(this.data, {this.message}) : success = false;
}
