import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['X-Api-Key'] = "4SjrqTLGw6QCpJJHqQpN+g==o5yNteImeSMT8WRf";
    super.onRequest(options, handler);
  }
}
