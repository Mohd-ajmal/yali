// To parse this JSON data, do
//
//     final itemTypesModel = itemTypesModelFromJson(jsonString);

import 'dart:convert';

ItemTypesModel itemTypesModelFromJson(String str) => ItemTypesModel.fromJson(json.decode(str));

String itemTypesModelToJson(ItemTypesModel data) => json.encode(data.toJson());

class ItemTypesModel {
    ItemTypesModel({
        required this.data,
    });

    List<Datum> data;

    factory ItemTypesModel.fromJson(Map<String, dynamic> json) => ItemTypesModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        required this.id,
        required this.typeName,
        required this.status,
    });

    int id;
    String typeName;
    int status;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        typeName: json["type_name"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "type_name": typeName,
        "status": status,
    };
}
