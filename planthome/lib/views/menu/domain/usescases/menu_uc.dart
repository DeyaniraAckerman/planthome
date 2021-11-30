import 'package:planthome/core/data/datasource/application_preferences.dart';
import 'package:planthome/views/menu/data/datasources/menu_data_source.dart';
import 'package:planthome/views/menu/data/model/UsuariosDatos.dart';

class MenuUc {
  final MenuDataSource _dataSource;

  MenuUc({required MenuDataSource loginDataSource})
      : _dataSource = loginDataSource;

  Future<UsuarioDatos> call(int id) async {
    return await _dataSource.getUsuarios(id.toString());
  }
}

class GetMenuException implements Exception {
  final String menssage;

  GetMenuException(this.menssage);
}
