import 'package:flutter_bloc/flutter_bloc.dart';





import 'package:planthome/views/registro_usuario/data/model/Sexo.dart';
import 'package:planthome/views/registro_usuario/data/model/UsuarioCreate.dart';
import 'package:planthome/views/registro_usuario/domain/usescases/registro_usuario_uc.dart';
import 'package:planthome/views/registro_usuario/presentacion/bloc/registro/registro_usuario_state.dart';

class RegistroUsuarioBloc extends Cubit<RegistroUsuarioState> {
  final RegistroUsuarioUc _loginUc;

  RegistroUsuarioBloc({required RegistroUsuarioUc loginUc, })
      : _loginUc = loginUc,
        super(RegistroUsuarioLoading());

   Future<List<Sexo>?>consultarSexo() async {
    try {
      emit(RegistroUsuarioLoading());
       List<Sexo> loginRespues = await _loginUc.callSexo();
       emit(RegistroUsuarioLoaded(loginRespues));
       return loginRespues;
    } on GetRegistroUsuarioException catch (error) {
      emit(RegistroUsuarioError(error.menssage));
      return null;
    }
  }
  Future<void>RegistrarUsuario(UsuariosCreate crearUsuario)async{
     await _loginUc.callRegistrar(crearUsuario);
  }
}
