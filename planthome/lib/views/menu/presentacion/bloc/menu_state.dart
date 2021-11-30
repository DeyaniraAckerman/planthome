import 'package:planthome/views/menu/data/model/UsuariosDatos.dart';

abstract class MenuState {}

class MenuLoading extends MenuState {}

class MenuLoaded extends MenuState {
  final UsuarioDatos loginRespues;

  MenuLoaded(this.loginRespues);
}

class MenuError extends MenuState {
  final String message;

  MenuError(this.message);
}
