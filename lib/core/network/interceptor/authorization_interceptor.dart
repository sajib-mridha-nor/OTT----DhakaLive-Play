import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

// ignore: constant_identifier_names
// Request methods PUT, POST, PATCH, DELETE needs access token,
// which needs to be passed with "Authorization" header as Bearer token.
class AuthorizationInterceptor extends Interceptor {
  final _box = GetStorage();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = 'Bearer ${_box.read("jwt")}';
    // continue with the request
    super.onRequest(options, handler);
  }
}
