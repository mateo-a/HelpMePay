// To parse this JSON data, do
//
//     final negociosInvestor = negociosInvestorFromJson(jsonString);

import 'dart:convert';

List<NegociosInvestor> negociosInvestorFromJson(String str) => List<NegociosInvestor>.from(json.decode(str).map((x) => NegociosInvestor.fromJson(x)));

String negociosInvestorToJson(List<NegociosInvestor> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NegociosInvestor {
    NegociosInvestor({
        this.id,
    });

    String id;

    factory NegociosInvestor.fromJson(Map<String, dynamic> json) => NegociosInvestor(
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
    };
}