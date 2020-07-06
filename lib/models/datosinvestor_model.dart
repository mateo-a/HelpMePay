// To parse this JSON data, do
//
//     final datosInvestor = datosInvestorFromJson(jsonString);

import 'dart:convert';

DatosInvestor datosInvestorFromJson(String str) => DatosInvestor.fromJson(json.decode(str));

String datosInvestorToJson(DatosInvestor data) => json.encode(data.toJson());

class DatosInvestor {
    DatosInvestor({
        this.aportes,
        this.ganancias,
        this.apellido,
        this.capital,
        this.imagen,
        this.nombre,
        this.cedula,
        this.recibido,
        this.contribucion,
    });

    int aportes;
    int ganancias;
    String apellido;
    int capital;
    String imagen;
    String nombre;
    String cedula;
    double recibido;
    int contribucion;

    factory DatosInvestor.fromJson(Map<String, dynamic> json) => DatosInvestor(
        aportes: json["aportes"],
        ganancias: json["ganancias"],
        apellido: json["apellido"],
        capital: json["capital"],
        imagen: json["imagen"],
        nombre: json["nombre"],
        cedula: json["cedula"],
        recibido: json["recibido"].toDouble(),
        contribucion: json["contribucion"],
    );

    Map<String, dynamic> toJson() => {
        "aportes": aportes,
        "ganancias": ganancias,
        "apellido": apellido,
        "capital": capital,
        "imagen": imagen,
        "nombre": nombre,
        "cedula": cedula,
        "recibido": recibido,
        "contribucion": contribucion,
    };
}
