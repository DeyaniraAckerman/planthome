

import 'dart:convert';

List<Sexo> SexoFromJson(String str) => List<Sexo>.from(json.decode(str).map((x)=>Sexo.fromJson(x)));

class Sexo {
  final int id;
  final String nombre;

  Sexo({required this.id, required this.nombre});

  factory Sexo.fromJson(Map<String, dynamic> json) => Sexo(
        id: json["id"],
        nombre: json["nombre"],
      );
  Map<String, dynamic> toJson() => {
    "id": id,
    "nombre": nombre,
  };
}
