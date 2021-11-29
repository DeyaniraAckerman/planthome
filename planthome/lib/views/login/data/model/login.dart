import 'dart:convert';

Login LoginFromJson(String str) => Login.fromJson(json.decode(str));

String LoginToJson(Login data) => json.encode(data.toJson());

class Login {
  int id;
  String usuario;
  String contrasena;
  int idTipoUsuario;
  int idPersona;
  int idSociales;

  Login(
      {required this.id,
      required this.usuario,
      required this.contrasena,
      required this.idTipoUsuario,
      required this.idPersona,
      required this.idSociales});

  factory Login.fromJson(Map<String, dynamic> json) => Login(
      id: json["id"],
      usuario: json["usuario"],
      contrasena: json["contrasena"],
      idTipoUsuario: json["idTipoUsuario"],
      idPersona: json["idPersona"],
      idSociales: json["idSociales"]);

  Map<String, dynamic> toJson() => {
        "usuario": usuario,
        "contrasena": contrasena,
        "idTipoUsuario": idTipoUsuario,
        "idPersona": idPersona,
        "idSociales": idSociales
      };
}
