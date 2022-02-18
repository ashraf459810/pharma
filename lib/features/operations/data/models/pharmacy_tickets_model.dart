// To parse this JSON data, do
//
//     final pharmacyTicketsModel = pharmacyTicketsModelFromJson(jsonString);

import 'dart:convert';

PharmacyTicketsModel pharmacyTicketsModelFromJson(String str) => PharmacyTicketsModel.fromJson(json.decode(str));

String pharmacyTicketsModelToJson(PharmacyTicketsModel data) => json.encode(data.toJson());

class PharmacyTicketsModel {
    PharmacyTicketsModel({
        this.azsvr,
        this.response,
    });

    String azsvr;
    List<PharmacyTickets> response;

    factory PharmacyTicketsModel.fromJson(Map<String, dynamic> json) => PharmacyTicketsModel(
        azsvr: json["AZSVR"],
        response: List<PharmacyTickets>.from(json["Response"].map((x) => PharmacyTickets.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "AZSVR": azsvr,
        "Response": List<dynamic>.from(response.map((x) => x.toJson())),
    };
}

class PharmacyTickets {
    PharmacyTickets({
        this.id,
        this.name,
    });

    int id;
    String name;

    factory PharmacyTickets.fromJson(Map<String, dynamic> json) => PharmacyTickets(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
