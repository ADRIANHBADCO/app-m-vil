import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  String? idusuario;
  String? nombre;
  String? apaterno;
  String? amaterno;
  String? telefono;
  String? email;
  String? direccion;
  String? nombreUsuario;
  int? idpreguntasecreta;
  String? respuesta;
  String? password;
  String? imagen;
  String? sessionToken;

  User({
    this.idusuario,
    this.nombre,
    this.apaterno,
    this.amaterno,
    this.telefono,
    this.email,
    this.direccion,
    this.nombreUsuario,
    this.idpreguntasecreta,
    this.respuesta,
    this.password,
    this.imagen,
    this.sessionToken,
  });

  static List<User> fromJsonList(List<dynamic> jsonList) {
    List<User> toList = [];

    jsonList.forEach((item) {
      User user = User.fromJson(item);
      toList.add(user);
    });

    return toList;
  }

  factory User.fromJson(Map<String, dynamic> json) => User(
        idusuario: json["idusuario"],
        nombre: json["nombre"],
        apaterno: json["apaterno"],
        amaterno: json["amaterno"],
        telefono: json["telefono"],
        email: json["email"],
        direccion: json["direccion"],
        nombreUsuario: json["nombre_usuario"],
        idpreguntasecreta: json["idpreguntasecreta"],
        respuesta: json["respuesta"],
        password: json["password"],
        imagen: json["imagen"],
        sessionToken: json["session_token"],
      );

  Map<String, dynamic> toJson() => {
        "idusuario": idusuario,
        "nombre": nombre,
        "apaterno": apaterno,
        "amaterno": amaterno,
        "telefono": telefono,
        "email": email,
        "direccion": direccion,
        "nombre_usuario": nombreUsuario,
        "idpreguntasecreta": idpreguntasecreta,
        "respuesta": respuesta,
        "password": password,
        "imagen": imagen,
        "session_token": sessionToken,
      };
}
