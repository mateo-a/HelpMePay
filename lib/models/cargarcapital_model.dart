// To parse this JSON data, do
//
//     final agregarCapital = agregarCapitalFromJson(jsonString);

import 'dart:convert';

AgregarCapital agregarCapitalFromJson(String str) => AgregarCapital.fromJson(json.decode(str));

String agregarCapitalToJson(AgregarCapital data) => json.encode(data.toJson());

class AgregarCapital {
    AgregarCapital({
        this.id,
        this.capital,
    });

    String id;
    int capital;

    factory AgregarCapital.fromJson(Map<String, dynamic> json) => AgregarCapital(
        id: json["id"],
        capital: json["capital"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "capital": capital,
    };
}
