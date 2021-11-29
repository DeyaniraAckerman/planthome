
import 'package:planthome/views/registro_usuario/data/model/Sexo.dart';

abstract class RegistroUsuarioState {}

class RegistroUsuarioLoading extends RegistroUsuarioState {}

class RegistroUsuarioLoaded extends RegistroUsuarioState {
  final List<Sexo>? registroUsuario;
  RegistroUsuarioLoaded(this.registroUsuario);
}

class RegistroUsuarioError extends RegistroUsuarioState {
  final String message;
  RegistroUsuarioError(this.message);
}
