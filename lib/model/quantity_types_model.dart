// To parse this JSON data, do
//
//     final itemQuantityTypes = itemQuantityTypesFromJson(jsonString);

import 'dart:convert';

ItemQuantityTypes itemQuantityTypesFromJson(String str) => ItemQuantityTypes.fromJson(json.decode(str));

String itemQuantityTypesToJson(ItemQuantityTypes data) => json.encode(data.toJson());

class ItemQuantityTypes {
    ItemQuantityTypes({
        required this.data,
    });

    List<Datum> data;

    factory ItemQuantityTypes.fromJson(Map<String, dynamic> json) => ItemQuantityTypes(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        required this.id,
        required this.quantityName,
        required this.status,
    });

    int id;
    String quantityName;
    int status;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        quantityName: json["quantity_name"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "quantity_name": quantityName,
        "status": status,
    };
}
