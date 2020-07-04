// To parse this JSON data, do
//
//     final workerModel = workerModelFromJson(jsonString);

import 'dart:convert';

WorkerModel workerModelFromJson(String str) => WorkerModel.fromJson(json.decode(str));

String workerModelToJson(WorkerModel data) => json.encode(data.toJson());

class WorkerModel {
    WorkerModel({
        this.id,
        this.nombre,
        this.apellido,
        this.cedula, 
        this.imagen = 'https:',
    });

    String id;
    String nombre;
    String apellido;
    String cedula;
    String imagen;

    factory WorkerModel.fromJson(Map<String, dynamic> json) => WorkerModel(
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