// To parse this JSON data, do
//
//     final aportarNegocio = aportarNegocioFromJson(jsonString);

import 'dart:convert';

AportarNegocio aportarNegocioFromJson(String str) => AportarNegocio.fromJson(json.decode(str));

String aportarNegocioToJson(AportarNegocio data) => json.encode(data.toJson());

class AportarNegocio {
    AportarNegocio({
        this.idnegocio,
        this.aporte,
        this.idinversionista,
    });

    String idnegocio;
    int aporte;
    String idinversionista;

    factory AportarNegocio.fromJson(Map<String, dynamic> json) => AportarNegocio(
        idnegocio: json["idnegocio"],
        aporte: json["aporte"],
        idinversionista: json["idinversionista"],
    );

    Map<String, dynamic> toJson() => {
        "idnegocio": idnegocio,
        "aporte": aporte,
        "idinversionista": idinversionista,
    };
}
