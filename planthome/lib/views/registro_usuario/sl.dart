import 'package:planthome/core/service_locator.dart';
import 'package:planthome/views/registro_usuario/data/datasources/registro_usuario_data_source.dart';
import 'package:planthome/views/registro_usuario/domain/usescases/registro_usuario_uc.dart';
import 'package:planthome/views/registro_usuario/presentacion/bloc/registro/registro_usuario_bloc.dart';

void initFeatureRegistro() {
  sl.registerFactory(() => RegistroUsuarioDataSource(webClient: sl()));
  sl.registerFactory(() => RegistroUsuarioUc(
    loginDataSource: sl(),
  ));
  sl.registerFactory(() => RegistroUsuarioBloc(loginUc: sl()));
}
