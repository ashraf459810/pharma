// To parse this JSON data, do
//
//     final rolesModel = rolesModelFromJson(jsonString);

import 'dart:convert';

RolesModel rolesModelFromJson(String str) => RolesModel.fromJson(json.decode(str));

String rolesModelToJson(RolesModel data) => json.encode(data.toJson());

class RolesModel {
    RolesModel({
        this.azsvr,
        this.response,
    });

    String azsvr;
    List<Roles> response;

    factory RolesModel.fromJson(Map<String, dynamic> json) => RolesModel(
        azsvr: json["AZSVR"],
        response: List<Roles>.from(json["Response"].map((x) => Roles.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "AZSVR": azsvr,
        "Response": List<dynamic>.from(response.map((x) => x.toJson())),
    };
}

class Roles {
    Roles({
        this.id,
        this.name,
        this.roleType,

    });

    int id;
    String name;
    String roleType;


    factory Roles.fromJson(Map<String, dynamic> json) => Roles(
        id: json["id"],
        name: json["name"],
        roleType: json["role_type"],
    
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "role_type": roleType,

    };
}
