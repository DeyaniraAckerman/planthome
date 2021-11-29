import 'dart:developer';
import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:planthome/core/error/exception.dart';

import 'package:planthome/core/error/exception.dart';

import 'web_client.dart';

class DioWebClientImpl extends WebClient {
  late HttpClient _httpClient;
  late Dio _dio;

  DioWebClientImpl() {
    _httpClient = HttpClient()
      ..badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);

    BaseOptions _baseOption = BaseOptions(
      headers: {},
      baseUrl: basePath,
      connectTimeout: 35000,
      receiveTimeout: 35000,
      sendTimeout: 35000,
      contentType: 'application/x-www-form-urlencoded',
      followRedirects: false,
      validateStatus: (status) => true,
    );

    _dio = Dio(_baseOption);
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) => _httpClient;
    final cookieJar = CookieJar();
    final cookieManager = CookieManager(cookieJar);
    _dio.interceptors.add(cookieManager);
    // _dio.interceptors.add(LogInterceptor(
    //   requestHeader: true,
    //   requestBody: true,
    //   responseHeader: true,
    //   responseBody: true,
    // ));
  }

  Future<List<int>?> download(String path,
      {Map<String, String>? params, Map<String, String>? headers}) async {
    try {
      Uri uri = buildUri(path, params);

      final resp = await _dio.getUri<List<int>>(uri,
          options: Options(
            headers: headers,
            responseType: ResponseType.bytes,
          ));
      return resp.data;
    } catch (error) {
      log('$error');
      throw ServerException(message: '$error');
    }
  }

  @override
  Future<WebResponse> get(String path,
      {Map<String, String>? params, Map<String, String>? headers}) async {
    try {
      Stopwatch time = Stopwatch()..start();
      Uri uri = buildUri(path, params);

      final resp =
      await _dio.getUri<String>(uri, options: Options(headers: headers));
      return _processResponse(resp, time);
    } catch (error) {
      log('$error');
      throw ServerException(message: '$error');
    }
  }

  @override
  Future<WebResponse> post(String path, String object,
      {Map<String, String>? params, Map<String, String>? headers}) async {
    try {
      Stopwatch time = Stopwatch()..start();
      Uri uri = buildUri(path, params);

      final resp = await _dio.postUri<String>(
        uri,
        options: Options(headers: headers),
        data: object,
      );
      return _processResponse(resp, time);
    } catch (error) {
      log('$error');
      throw ServerException(message: '$error');
    }
  }

  @override
  Future<WebResponse> put(String path, String object,
      {Map<String, String>? params, Map<String, String>? headers}) async {
    try {
      Stopwatch time = Stopwatch()..start();
      Uri uri = buildUri(path, params);

      final resp = await _dio.putUri<String>(
        uri,
        options: Options(headers: headers),
        data: object,
      );
      return _processResponse(resp, time);
    } catch (error) {
      log('$error');
      throw ServerException(message: '$error');
    }
  }

  @override
  Future<WebResponse> delete(String path,
      {Map<String, String>? params, Map<String, String>? headers}) async {
    try {
      Stopwatch time = Stopwatch()..start();
      Uri uri = buildUri(path, params);

      final resp = await _dio.deleteUri<String>(
        uri,
        options: Options(headers: headers),
      );
      return _processResponse(resp, time);
    } catch (error) {
      log('$error');
      throw ServerException(message: '$error');
    }
  }

  WebResponse _processResponse(Response<String> resp, Stopwatch time) {
    //ejemplo de  mensaje personalizado en caso de error para el status 404.
    // if (resp.statusCode == 404) {
    //   throw ServerException(message: 'Recurso no encontrado');
    // }
    // if (resp.statusCode != 200) {
    //   throw ServerException(message: 'Error al consulta el API');
    // }
    WebResponse response = _buildResponse(resp);
    log('response ${resp.realUri.pathSegments.last}, time: ${time.elapsedMilliseconds}, $response');
    return response;
  }

  WebResponse _buildResponse(Response<String> resp) {
    return WebResponse(
      statusCode: resp.statusCode,
      body: resp.data!,
      headers: {
        ...resp.headers.map.map((s, l) => MapEntry(s, l.toString())),
      },
    );
  }
}
