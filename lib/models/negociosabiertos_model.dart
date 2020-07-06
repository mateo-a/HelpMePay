// To parse this JSON data, do
//
//     final negociosAbiertosModel = negociosAbiertosModelFromJson(jsonString);

import 'dart:convert';

List<NegociosAbiertosModel> negociosAbiertosModelFromJson(String str) => List<NegociosAbiertosModel>.from(json.decode(str).map((x) => NegociosAbiertosModel.fromJson(x)));

String negociosAbiertosModelToJson(List<NegociosAbiertosModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NegociosAbiertosModel {
    NegociosAbiertosModel({
        this.saldoAportes,
        this.vrPagado,
        this.totalcuotas,
        this.saldoPagar,
        this.monto,
        this.titulo,
        this.idfire,
        this.descripcion,
        this.vrPagar,
        this.estado,
        this.worker,
        this.fechalimite,
        this.aportes,
    });

    int saldoAportes;
    int vrPagado;
    int totalcuotas;
    int saldoPagar;
    int monto;
    String titulo;
    String idfire;
    String descripcion;
    int vrPagar;
    String estado;
    String worker;
    String fechalimite;
    int aportes;

    factory NegociosAbiertosModel.fromJson(Map<String, dynamic> json) => NegociosAbiertosModel(
        saldoAportes: json["saldoAportes"],
        vrPagado: json["vrPagado"],
        totalcuotas: json["totalcuotas"],
        saldoPagar: json["saldoPagar"],
        monto: json["monto"],
        titulo: json["titulo"],
        idfire: json["idfire"] == null ? null : json["idfire"],
        descripcion: json["descripcion"],
        vrPagar: json["vrPagar"],
        estado: json["estado"],
        worker: json["worker"],
        fechalimite: json["fechalimite"],
        aportes: json["aportes"],
    );

    Map<String, dynamic> toJson() => {
        "saldoAportes": saldoAportes,
        "vrPagado": vrPagado,
        "totalcuotas": totalcuotas,
        "saldoPagar": saldoPagar,
        "monto": monto,
        "titulo": titulo,
        "idfire": idfire == null ? null : idfire,
        "descripcion": descripcion,
        "vrPagar": vrPagar,
        "estado": estado,
        "worker": worker,
        "fechalimite": fechalimite,
        "aportes": aportes,
    };
}
