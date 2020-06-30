// To parse this JSON data, do
//
//     final investorModel = investorModelFromJson(jsonString);

import 'dart:convert';

InvestorModel investorModelFromJson(String str) => InvestorModel.fromJson(json.decode(str));

String investorModelToJson(InvestorModel data) => json.encode(data.toJson());

class InvestorModel {
    InvestorModel({
        this.id = '20007',
        this.nombre = 'Roman',
        this.apellido = 'Tellez',
        this.cedula = '78666555', 
        this.imagen = 'https:',
    });

    String id;
    String nombre;
    String apellido;
    String cedula;
    String imagen;

    factory InvestorModel.fromJson(Map<String, dynamic> json) => InvestorModel(
        id        : json["id"],
        nombre    : json["nombre"],
        apellido  : json["apellido"],
        cedula    : json["cedula"],
        imagen    : json["imagen"],
    );

    Map<String, dynamic> toJson() => {
        "id"        : id,
        "nombre"    : nombre,
        "apellido"  : apellido,
        "cedula"    : cedula,
        "imagen"    : imagen,
    };
}