import 'dart:convert';

Cita citaFromJson(String str) => Cita.fromJson(json.decode(str));

String citaToJson(Cita data) => json.encode(data.toJson());

class Cita {
  String? id;
  String? nombreMascota;
  String? razaMascota;
  String? nombrePropietario;
  String? telefonoPropietario;
  String? edadMascota;
  String? sexoMascota;
  String? fechaCita;
  int? horaCita;
  String? razonCita;
  String? estadoCita;
  int? idusuario;

  Cita({
    this.id,
    this.nombreMascota,
    this.razaMascota,
    this.nombrePropietario,
    this.telefonoPropietario,
    this.edadMascota,
    this.sexoMascota,
    this.fechaCita,
    this.horaCita,
    this.razonCita,
    this.estadoCita,
    this.idusuario,
  });

  factory Cita.fromJson(Map<String, dynamic> json) => Cita(
        id: json["id"],
        nombreMascota: json["nombre_mascota"],
        razaMascota: json["raza_mascota"],
        nombrePropietario: json["nombre_propietario"],
        telefonoPropietario: json["telefono_propietario"],
        edadMascota: json["edad_mascota"],
        sexoMascota: json["sexo_mascota"],
        fechaCita: json["fecha_cita"],
        horaCita: json["hora_cita"],
        razonCita: json["razon_cita"],
        estadoCita: json["estado_cita"],
        idusuario: json["idusuario"],
      );

  static List<Cita> fromJsonList(List<dynamic> jsonList) {
    List<Cita> toList = [];

    jsonList.forEach((item) {
      Cita cites = Cita.fromJson(item);
      toList.add(cites);
    });

    return toList;
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre_mascota": nombreMascota,
        "raza_mascota": razaMascota,
        "nombre_propietario": nombrePropietario,
        "telefono_propietario": telefonoPropietario,
        "edad_mascota": edadMascota,
        "sexo_mascota": sexoMascota,
        "fecha_cita": fechaCita,
        "hora_cita": horaCita,
        "razon_cita": razonCita,
        "estado_cita": estadoCita,
        "idusuario": idusuario,
      };
}
