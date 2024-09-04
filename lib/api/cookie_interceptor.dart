
import 'package:dio/dio.dart';

import '../common/shared_preferences.dart';

class CookieInterceptor extends Interceptor{
  String? _cookie;

  @override
  Future<void>onRequest(RequestOptions options,RequestInterceptorHandler handler) async{
    if (_cookie != null){
      options.headers['Cookie'] = _cookie;
    }
    return super.onRequest(options, handler);
  }
  Future<void> onResponse(Response response, ResponseInterceptorHandler handler) async{
    final headers = response.headers.map;
    if(headers.containsKey('set-cookie')){
      final cookie = headers['set-cookie'];
      if(cookie != null && cookie.length>=3){
        final mainCookie = cookie[2];
        final cookieValue = mainCookie.split(';')[0];
        _cookie =cookieValue;
        UserSimplePreferences.setCookie(_cookie!);
      }
    }
    return super.onResponse(response, handler);
  }
}