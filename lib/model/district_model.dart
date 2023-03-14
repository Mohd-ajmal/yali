// To parse this JSON data, do
//
//     final districtModel = districtModelFromJson(jsonString);

import 'dart:convert';

DistrictModel districtModelFromJson(String str) => DistrictModel.fromJson(json.decode(str));

String districtModelToJson(DistrictModel data) => json.encode(data.toJson());

class DistrictModel {
    DistrictModel({
        required this.data,
    });

    List<Datum> data;

    factory DistrictModel.fromJson(Map<String, dynamic> json) => DistrictModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        required this.id,
        required this.stateId,
        required this.districtName,
        required this.status,
    });

    int id;
    int stateId;
    String districtName;
    int status;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        stateId: json["state_id"],
        districtName: json["district_name"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "state_id": stateId,
        "district_name": districtName,
        "status": status,
    };
}
