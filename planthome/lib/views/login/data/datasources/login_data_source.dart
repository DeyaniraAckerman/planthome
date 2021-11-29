import 'package:planthome/core/network/web_client.dart';
import 'package:planthome/views/login/data/model/login.dart';


import 'package:planthome/core/network/web_client.dart';
import 'package:planthome/views/login/data/model/login.dart';


class LoginDataSource {
  final WebClient _webClient;

  LoginDataSource({required WebClient webClient}) : _webClient = webClient;

  Future<Login> iniciarsesion(String usuario, String contrasena) async {
    const String path = '/api/Usuarios';
    final resp = await _webClient.get(
      path, params: {'usuario': usuario, 'contrasena': contrasena});
    return LoginFromJson(resp.body);
  }
}
