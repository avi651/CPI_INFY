class DataExceptions implements Exception {
  String? message;

  DataExceptions([this.message = 'Something went wrong']) {
    message = 'Data exception $message';
  }

  @override
  String toString() {
    return message ?? "";
  }
}