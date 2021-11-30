import 'package:planthome/core/network/web_client.dart';
import 'package:planthome/views/menu/data/model/UsuariosDatos.dart';

class MenuDataSource {
  final WebClient _webClient;

  MenuDataSource({required WebClient webClient}) : _webClient = webClient;

  Future<UsuarioDatos> getUsuarios(String id) async {
    const String path = '/api/Usuarios';
    final resp = await _webClient.get(path, params: {'id': id});
    return LoginFromJson(resp.body);
  }
}
