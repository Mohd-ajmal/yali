// To parse this JSON data, do
//
//     final getDistrict = getDistrictFromJson(jsonString);

import 'dart:convert';

GetDistrict getDistrictFromJson(String str) => GetDistrict.fromJson(json.decode(str));

String getDistrictToJson(GetDistrict data) => json.encode(data.toJson());

class GetDistrict {
    GetDistrict({
        required this.data,
    });

    List<Datum> data;

    factory GetDistrict.fromJson(Map<String, dynamic> json) => GetDistrict(
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
