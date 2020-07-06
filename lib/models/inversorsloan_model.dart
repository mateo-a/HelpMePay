// To parse this JSON data, do
//
//     final inversorsLoanModel = inversorsLoanModelFromJson(jsonString);

import 'dart:convert';

List<InversorsLoanModel> inversorsLoanModelFromJson(String str) => List<InversorsLoanModel>.from(json.decode(str).map((x) => InversorsLoanModel.fromJson(x)));

String inversorsLoanModelToJson(List<InversorsLoanModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class InversorsLoanModel {
    InversorsLoanModel({
        this.id,
        this.data,
    });

    String id;
    Data data;

    factory InversorsLoanModel.fromJson(Map<String, dynamic> json) => InversorsLoanModel(
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
        this.saldo,
        this.porcAporte,
        this.aporte,
        this.vrPagado,
        this.estado,
        this.ganancia,
    });

    double saldo;
    int porcAporte;
    int aporte;
    double vrPagado;
    String estado;
    double ganancia;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        saldo: json["saldo"].toDouble(),
        porcAporte: json["porcAporte"],
        aporte: json["aporte"],
        vrPagado: json["vrPagado"].toDouble(),
        estado: json["estado"],
        ganancia: json["ganancia"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "saldo": saldo,
        "porcAporte": porcAporte,
        "aporte": aporte,
        "vrPagado": vrPagado,
        "estado": estado,
        "ganancia": ganancia,
    };
}
