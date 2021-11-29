

import 'package:planthome/core/network/web_client.dart';
import 'package:planthome/views/registro_usuario/data/model/Sexo.dart';
import 'package:planthome/views/registro_usuario/data/model/UsuarioCreate.dart';

class RegistroUsuarioDataSource {
  final WebClient _webClient;

  RegistroUsuarioDataSource({required WebClient webClient})
      : _webClient = webClient;

  Future<List<Sexo>> consultarCategoria() async {
    const String path = '/api/tblSexos/';
    final resp = await _webClient.get(path);
    return SexoFromJson(resp.body);
  }

  Future<void> crearUsuario(UsuariosCreate crearUsuario) async {
    const String path = '/api/Usuarios/';
    await _webClient.post(path, usuarioToJson(crearUsuario),
        headers: {'Content-Type': 'application/json; charset=UTF-8'});
  }
}
