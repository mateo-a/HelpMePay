// To parse this JSON data, do
//
//     final loanModel = loanModelFromJson(jsonString);

import 'dart:convert';

LoanModel loanModelFromJson(String str) => LoanModel.fromJson(json.decode(str));

String loanModelToJson(LoanModel data) => json.encode(data.toJson());

class LoanModel {
    LoanModel({
        this.worker,
        this.totalcuotas,
        this.titulo,
        this.monto,
        this.fechalimite,
        this.descripcion,
    });

    String worker;
    int totalcuotas;
    String titulo;
    int monto;
    String fechalimite;
    String descripcion;

    factory LoanModel.fromJson(Map<String, dynamic> json) => LoanModel(
        worker: json["worker"],
        totalcuotas: json["totalcuotas"],
        titulo: json["titulo"],
        monto: json["monto"],
        fechalimite: json["fechalimite"],
        descripcion: json["descripcion"],
    );

    Map<String, dynamic> toJson() => {
        "worker": worker,
        "totalcuotas": totalcuotas,
        "titulo": titulo,
        "monto": monto,
        "fechalimite": fechalimite,
        "descripcion": descripcion,
    };
}