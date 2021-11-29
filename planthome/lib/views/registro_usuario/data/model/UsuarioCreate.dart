import 'dart:convert';

String usuarioToJson(UsuariosCreate data) => json.encode(data.toJson());

class UsuariosCreate {
  int? id;
  final String nombre;
  final String apellidoPa;
  final String apellidoma;
  final int idSexo;
  final DateTime nacimiento;
  final String usuario;
  final String contrasena;

  UsuariosCreate(this.nombre, this.apellidoPa, this.apellidoma, this.idSexo,
      this.nacimiento,this.usuario, this.contrasena);

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "apellidoPa": apellidoPa,
        "apellidoma": apellidoma,
        "idSexo": idSexo,
        "usuario": usuario,
        "contrasena": contrasena,
      };
}
