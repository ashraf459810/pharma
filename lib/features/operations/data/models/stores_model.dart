// To parse this JSON data, do
//
//     final storesModel = storesModelFromJson(jsonString);

import 'dart:convert';

StoresModel storesModelFromJson(String str) => StoresModel.fromJson(json.decode(str));

String storesModelToJson(StoresModel data) => json.encode(data.toJson());

class StoresModel {
    StoresModel({
        this.azsvr,
        this.warehouses,
    });

    String azsvr;
    List<Warehouse> warehouses;

    factory StoresModel.fromJson(Map<String, dynamic> json) => StoresModel(
        azsvr: json["AZSVR"],
        warehouses: List<Warehouse>.from(json["Warehouses"].map((x) => Warehouse.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "AZSVR": azsvr,
        "Warehouses": List<dynamic>.from(warehouses.map((x) => x.toJson())),
    };
}

class Warehouse {
    Warehouse({
        this.id,
        this.name,
        this.phone,
        this.location,
    });

    int id;
    String name;
    String phone;
    String location;

    factory Warehouse.fromJson(Map<String, dynamic> json) => Warehouse(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        location: json["location"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "location": location,
    };
}
