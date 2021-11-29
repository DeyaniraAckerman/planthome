import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:planthome/core/error/exception.dart';
import 'package:planthome/core/network/web_client.dart';


import 'package:planthome/core/error/exception.dart';
import 'package:planthome/core/network/web_client.dart';

class HttpWeb extends WebClient {
  @override
  Future<WebResponse> get(String path,
      {Map<String, String>? params, Map<String, String>? headers}) async {
    Uri uri = buildUri(path, params);
    try {
      Stopwatch time = Stopwatch()
        ..start();
      final http.Response response = await http.get(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },);
      return _processResponse(response, time);
    } catch (error) {
      log('$error');
      throw ServerException(message: '$error');
    }
  }

  @override
  Future<WebResponse> post(String path,String object,
      {Map<String, String>? params, Map<String,
          String>? headers}) async {
    Uri uri = buildUri(path, params);
    try {
      Stopwatch time = Stopwatch()
        ..start();
      final http.Response response = await http.post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
        }),
      );
      return _processResponse(response, time);
    } catch (error) {
      log('$error');
      throw ServerException(message: '$error');
    }
  }
  @override
  Future<WebResponse> put(String path,String object,
      {Map<String, String>? params, Map<String,
          String>? headers}) async {
    Uri uri = buildUri(path, params);
    try {
      Stopwatch time = Stopwatch()
        ..start();
      final http.Response response = await http.put(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
        }),
      );
      return _processResponse(response, time);
    } catch (error) {
      log('$error');
      throw ServerException(message: '$error');
    }
  }
  @override
  Future<WebResponse> delete(String path,
      {Map<String, String>? params, Map<String,
          String>? headers}) async {
    Uri uri = buildUri(path, params);
    try {
      Stopwatch time = Stopwatch()
        ..start();
      final http.Response response = await http.delete(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      return _processResponse(response, time);
    } catch (error) {
      log('$error');
      throw ServerException(message: '$error');
    }
  }

  WebResponse _processResponse(http.Response resp, Stopwatch time) {
    log('${resp.request?.url.pathSegments.last} time: ${time
        .elapsedMilliseconds}');
    //ejemplo de  mensaje personalizado en caso de error para el status 404.
    if (resp.statusCode == 404) {
      throw ServerException(message: 'Recurso no encontrado');
    }
    if (resp.statusCode != 200) {
      throw ServerException(message: 'Error al consulta el API');
    }
    return _buildResponse(resp);
  }

  WebResponse _buildResponse(http.Response resp) {
    log('response: ${resp.body}');
    return WebResponse(
      statusCode: resp.statusCode,
      body: resp.body,
      headers: {
        // ...resp.headers.map.map((s, l) => MapEntry(s, l.toString())),
      },
    );
  }

}