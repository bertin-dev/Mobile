class APIResponse {
  var data;
  bool error;
  String? errorMessage;
  String? token;
  int? statusCode;
  APIResponse({
    this.data,
    this.errorMessage,
    this.token,
    this.error = false,
    this.statusCode,
  });
}
