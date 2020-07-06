// To parse this JSON data, do
//
//     final cuotasNegocioModel = cuotasNegocioModelFromJson(jsonString);

import 'dart:convert';

List<CuotasNegocioModel> cuotasNegocioModelFromJson(String str) => List<CuotasNegocioModel>.from(json.decode(str).map((x) => CuotasNegocioModel.fromJson(x)));

String cuotasNegocioModelToJson(List<CuotasNegocioModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CuotasNegocioModel {
    CuotasNegocioModel({
        this.id,
        this.data,
    });

    String id;
    Data data;

    factory CuotasNegocioModel.fromJson(Map<String, dynamic> json) => CuotasNegocioModel(
        id: json["id"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "data": data.toJson(),
    };
}

class Data {
    Data({
        this.valor,
        this.interes,
        this.aporte,
        this.estado,
        this.fechapago,
    });

    int valor;
    int interes;
    int aporte;
    String estado;
    String fechapago;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        valor: json["valor"],
        interes: json["interes"],
        aporte: json["aporte"],
        estado: json["estado"],
        fechapago: json["fechapago"],
    );

    Map<String, dynamic> toJson() => {
        "valor": valor,
        "interes": interes,
        "aporte": aporte,
        "estado": estado,
        "fechapago": fechapago,
    };
}