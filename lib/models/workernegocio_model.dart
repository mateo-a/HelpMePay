// To parse this JSON data, do
//
//     final workerNegocios = workerNegociosFromJson(jsonString);

import 'dart:convert';

List<WorkerNegocios> workerNegociosFromJson(String str) => List<WorkerNegocios>.from(json.decode(str).map((x) => WorkerNegocios.fromJson(x)));

String workerNegociosToJson(List<WorkerNegocios> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WorkerNegocios {
    WorkerNegocios({
        this.id,
        this.data,
    });

    String id;
    Data data;

    factory WorkerNegocios.fromJson(Map<String, dynamic> json) => WorkerNegocios(
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
        this.vrSolicitado,
        this.cuotasFaltantes,
        this.vrPagado,
        this.estado,
        this.vrPagar,
        this.saldo,
        this.cuotasTotales,
    });

    int vrSolicitado;
    int cuotasFaltantes;
    int vrPagado;
    String estado;
    int vrPagar;
    int saldo;
    int cuotasTotales;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        vrSolicitado: json["vrSolicitado"],
        cuotasFaltantes: json["cuotasFaltantes"],
        vrPagado: json["vrPagado"],
        estado: json["estado"],
        vrPagar: json["vrPagar"],
        saldo: json["saldo"],
        cuotasTotales: json["cuotasTotales"],
    );

    Map<String, dynamic> toJson() => {
        "vrSolicitado": vrSolicitado,
        "cuotasFaltantes": cuotasFaltantes,
        "vrPagado": vrPagado,
        "estado": estado,
        "vrPagar": vrPagar,
        "saldo": saldo,
        "cuotasTotales": cuotasTotales,
    };
}