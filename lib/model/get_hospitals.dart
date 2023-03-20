// To parse this JSON data, do
//
//     final getHospital = getHospitalFromJson(jsonString);

import 'dart:convert';

GetHospital getHospitalFromJson(String str) => GetHospital.fromJson(json.decode(str));

String getHospitalToJson(GetHospital data) => json.encode(data.toJson());

class GetHospital {
    GetHospital({
        required this.data,
    });

    List<Datum> data;

    factory GetHospital.fromJson(Map<String, dynamic> json) => GetHospital(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        required this.id,
        required this.userId,
        required this.hName,
        required this.vehicleId,
        required this.districtId,
        required this.infoStatus,
        required this.createdAt,
        required this.updatedAt,
    });

    int id;
    int userId;
    String hName;
    int vehicleId;
    int districtId;
    InfoStatus infoStatus;
    DateTime createdAt;
    DateTime updatedAt;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["user_id"],
        hName: json["h_name"],
        vehicleId: json["vehicle_id"],
        districtId: json["district_id"],
        infoStatus: infoStatusValues.map[json["info_status"]]!,
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "h_name": hName,
        "vehicle_id": vehicleId,
        "district_id": districtId,
        "info_status": infoStatusValues.reverse[infoStatus],
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

enum InfoStatus { INACTIVE, ACTIVE }

final infoStatusValues = EnumValues({
    "active": InfoStatus.ACTIVE,
    "inactive": InfoStatus.INACTIVE
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
