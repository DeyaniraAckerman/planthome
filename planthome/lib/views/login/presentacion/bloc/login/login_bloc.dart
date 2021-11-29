import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planthome/core/data/model/session.dart';
import 'package:planthome/views/login/data/model/login.dart';
import 'package:planthome/views/login/domain/usescases/login_uc.dart';
import 'package:planthome/views/login/presentacion/bloc/login/login_state.dart';





import 'package:planthome/core/data/model/session.dart';
import 'package:planthome/views/login/data/model/login.dart';
import 'package:planthome/views/login/domain/usescases/login_uc.dart';
import 'package:planthome/views/login/presentacion/bloc/login/login_state.dart';

class LoginBloc extends Cubit<LoginState> {
  final LoginUc _loginUc;
  final Session _session;

  LoginBloc({required LoginUc loginUc, required Session session})
      : _loginUc = loginUc,
        _session = session,
        super(LoginLoading());

  Future<void> iniciarSesion(String usuario, String contrasena) async {
    try {
      emit(LoginLoading());
      Login loginRespues = await _loginUc.call(usuario, contrasena);
      _session.usuario = loginRespues.usuario;
      _session.contrasena=loginRespues.contrasena;
      _session.id=loginRespues.id;
      _session.idPersona=loginRespues.idPersona;
      _session.idTipoUsuario=loginRespues.idTipoUsuario;
      _session.idSociales=loginRespues.idSociales;
    } on GetLoginException catch (error) {
      emit(LoginError(error.menssage));
    }
  }
}
