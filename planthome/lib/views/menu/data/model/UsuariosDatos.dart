import 'dart:convert';

UsuarioDatos LoginFromJson(String str) =>
    UsuarioDatos.fromJson(json.decode(str));

class UsuarioDatos {
  String usuario;
  String contrasena;
  String nombre;
  String apellidoPa;
  String apellidoma;
  DateTime nacimiento;
  int idSexo;

  UsuarioDatos(
      {required this.usuario,
      required this.contrasena,
      required this.nombre,
      required this.apellidoPa,
      required this.apellidoma,
      required this.nacimiento,
      required this.idSexo});

  factory UsuarioDatos.fromJson(Map<String, dynamic> json) => UsuarioDatos(
        usuario: json["usuario"],
        contrasena: json["contrasena"],
        nombre: json["nombre"],
        apellidoPa: json["apellidoPa"],
        apellidoma: json["apellidoma"],
        nacimiento: DateTime.parse(json["nacimiento"].toString()),
        idSexo: json["idSexo"],
      );

  Map<String, dynamic> toJson() => {
        "usuario": usuario,
        "contrasena": contrasena,
        "nombre": nombre,
        "apellidoPa": apellidoPa,
        "apellidoma": apellidoma,
        "nacimiento": nacimiento,
        "idSexo": idSexo,
      };
}
