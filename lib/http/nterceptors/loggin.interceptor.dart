
import 'package:http_interceptor/http_interceptor.dart';
import 'dart:developer' as developer;

class LogginInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    developer.log('Request');
    developer.log('url: ${data.url}');
    developer.log('headers: ${data.headers}');
    developer.log('body: ${data.body}');
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    developer.log('Response');
    developer.log('status code: ${data.statusCode}');
    developer.log('headers: ${data.headers}');
    developer.log('body: ${data.body}');
    return data;
  }
}