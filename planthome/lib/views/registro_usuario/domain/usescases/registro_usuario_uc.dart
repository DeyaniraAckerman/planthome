




import 'package:planthome/views/login/data/model/login.dart';
import 'package:planthome/views/registro_usuario/data/datasources/registro_usuario_data_source.dart';
import 'package:planthome/views/registro_usuario/data/model/Sexo.dart';
import 'package:planthome/views/registro_usuario/data/model/UsuarioCreate.dart';

class RegistroUsuarioUc {
  final RegistroUsuarioDataSource _dataSource;

  RegistroUsuarioUc({required RegistroUsuarioDataSource loginDataSource})
      : _dataSource = loginDataSource;

  Future<List<Sexo>> callSexo() async {
    return await _dataSource.consultarCategoria();
  }
  Future<void>callRegistrar(UsuariosCreate crearUsuario)async{
    await _dataSource.crearUsuario(crearUsuario);
  }
}

class GetRegistroUsuarioException implements Exception{
  final String menssage;
  GetRegistroUsuarioException(this.menssage);
}
