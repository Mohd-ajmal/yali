// To parse this JSON data, do
//
//     final getHospitals = getHospitalsFromJson(jsonString);

import 'dart:convert';

GetHospitals getHospitalsFromJson(String str) => GetHospitals.fromJson(json.decode(str));

String getHospitalsToJson(GetHospitals data) => json.encode(data.toJson());

class GetHospitals {
    GetHospitals({
        required this.data,
    });

    List<Datum> data;

    factory GetHospitals.fromJson(Map<String, dynamic> json) => GetHospitals(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        required this.id,
        required this.hospitalName,
        required this.status,
    });

    int id;
    String hospitalName;
    int status;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        hospitalName: json["hospital_name"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "hospital_name": hospitalName,
        "status": status,
    };
}
