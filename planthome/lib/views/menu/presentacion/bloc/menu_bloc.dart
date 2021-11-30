import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planthome/views/menu/data/model/UsuariosDatos.dart';
import 'package:planthome/views/menu/domain/usescases/menu_uc.dart';
import 'package:planthome/views/menu/presentacion/bloc/menu_state.dart';

class MenuBloc extends Cubit<MenuState> {
  final MenuUc _menuUc;

  MenuBloc({required MenuUc loginUc})
      : _menuUc = loginUc,
        super(MenuLoading());

  getUsuarios(int id) async {
    try {
      emit(MenuLoading());
      UsuarioDatos loginRespues = await _menuUc.call(id);
      emit(MenuLoaded(loginRespues));
    } on GetMenuException catch (error) {
      emit(MenuError(error.menssage));
    }
  }
}
