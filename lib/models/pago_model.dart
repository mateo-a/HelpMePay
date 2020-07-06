// To parse this JSON data, do
//
//     final pagoModel = pagoModelFromJson(jsonString);

import 'dart:convert';

PagoModel pagoModelFromJson(String str) => PagoModel.fromJson(json.decode(str));

String pagoModelToJson(PagoModel data) => json.encode(data.toJson());

class PagoModel {
    PagoModel({
        this.idcuota,
        this.idnegocio,
    });

    String idcuota;
    String idnegocio;

    factory PagoModel.fromJson(Map<String, dynamic> json) => PagoModel(
        idcuota: json["idcuota"],
        idnegocio: json["idnegocio"],
    );

    Map<String, dynamic> toJson() => {
        "idcuota": idcuota,
        "idnegocio": idnegocio,
    };
}
