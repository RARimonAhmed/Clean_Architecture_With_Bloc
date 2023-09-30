import 'package:dio/dio.dart';
import 'package:clean_with_bloc_practice/data/common/interceptor/request_interceptor.dart';

class NetworkModule {
  final Dio _dio = Dio();
  final String _baseUrl = "https://islameralo.bondhusoft.com/api";
  final RequestInterceptor requestInterceptor;

  NetworkModule({required this.requestInterceptor});

  BaseOptions _dioOptions(){
    BaseOptions opts = BaseOptions();
    opts.baseUrl = _baseUrl;
    opts.connectTimeout = const Duration(seconds: 6);
    opts.receiveTimeout = const Duration(seconds: 6);
    opts.sendTimeout = const Duration(seconds: 6);
    return opts;
  }


  Dio provideDio(){
    _dio.options = _dioOptions();
    _dio.interceptors.add(requestInterceptor);
    return _dio;
  }
}


// class NetworkModule {
//   final Dio _dio = Dio();
//   final String _baseUrl = "https://golang-heroku.herokuapp.com/api/";
//   final String _saveDeviceInfoUrl = "https://islameralo.bondhusoft.com/api";
//   final String _webBaseUrl = "https://golang-heroku.herokuapp.com/api/";
//   final RequestInterceptor requestInterceptor;
//   BaseOptions opts = BaseOptions();
//
//   NetworkModule({required this.requestInterceptor});
//
//   BaseOptions _dioOptions() {
//     opts.connectTimeout = const Duration(seconds: 6); //60000
//     opts.receiveTimeout = const Duration(seconds: 6);
//     opts.sendTimeout = const Duration(seconds: 6);
//     return opts;
//   }
//
//   Dio provideDio() {
//     _dio.options = _dioOptions();
//     _dio.options.baseUrl = _baseUrl;
//     _dio.interceptors.add(requestInterceptor);
//     return _dio;
//   }
//
//   Dio providePaymentDio() {
//     _dio.options = _dioOptions();
//     _dio.options.baseUrl = _saveDeviceInfoUrl;
//     _dio.interceptors.add(requestInterceptor);
//     return _dio;
//   }
//
//   Dio provideWebDio() {
//     _dio.options = _dioOptions();
//     _dio.options.baseUrl = _webBaseUrl;
//     _dio.interceptors.add(requestInterceptor);
//     return _dio;
//   }
// }
