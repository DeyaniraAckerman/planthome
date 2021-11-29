import 'package:planthome/core/data/datasource/application_preferences.dart';
import 'package:planthome/views/login/data/datasources/login_data_source.dart';
import 'package:planthome/views/login/data/model/login.dart';




import 'package:planthome/core/data/datasource/application_preferences.dart';
import 'package:planthome/views/login/data/datasources/login_data_source.dart';
import 'package:planthome/views/login/data/model/login.dart';

class LoginUc {
  final LoginDataSource _dataSource;
  final ApplicationPreferences _appPreferences;

  LoginUc(
      {required ApplicationPreferences appPreferences,
      required LoginDataSource loginDataSource})
      : _dataSource = loginDataSource,
        _appPreferences = appPreferences;

  Future<Login> call(String usuario, String contrasena) async {
    return await _dataSource.iniciarsesion(usuario, contrasena);
  }
}

class GetLoginException implements Exception {
  final String menssage;

  GetLoginException(this.menssage);
}
