// To parse this JSON data, do
//
//     final getOrders = getOrdersFromJson(jsonString);

import 'dart:convert';

GetOrders getOrdersFromJson(String str) => GetOrders.fromJson(json.decode(str));

String getOrdersToJson(GetOrders data) => json.encode(data.toJson());

class GetOrders {
    GetOrders({
        required this.data,
    });

    List<Datum> data;

    factory GetOrders.fromJson(Map<String, dynamic> json) => GetOrders(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        required this.id,
        required this.orderId,
        required this.userId,
        required this.senderId,
        required this.receiverId,
        required this.vId,
        required this.payload,
        required this.payloadWeight,
        required this.meta,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
    });

    int? id;
    String? orderId;
    int? userId;
    int? senderId;
    int? receiverId;
    int? vId;
    dynamic payload;
    int? payloadWeight;
    Meta? meta;
    String? status;
    DateTime? createdAt;
    DateTime? updatedAt;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        orderId: json["order_id"],
        userId: json["user_id"],
        senderId: json["sender_id"],
        receiverId: json["receiver_id"],
        vId: json["v_id"],
        payload: json["payload"],
        payloadWeight: json["payload_weight"],
        meta: Meta.fromJson(json["meta"] ?? ""),
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "order_id": orderId,
        "user_id": userId,
        "sender_id": senderId,
        "receiver_id": receiverId,
        "v_id": vId,
        "payload": payload!.toJson(),
        "payload_weight": payloadWeight,
        "meta": meta!.toJson(),
        "status": status,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
    };
}

class Meta {
    Meta({
        required this.vehicleStatus,
    });

    String vehicleStatus;

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        vehicleStatus: json["vehicle_status"] ?? "",
    );

    Map<String, dynamic> toJson() => {
        "vehicle_status": vehicleStatus,
    };
}

class Payload {
    Payload({
        required this.blood,
        required this.vaccine,
    });

    int? blood;
    int? vaccine;

    factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        blood: json["blood"],
        vaccine: json["vaccine"],
    );

    Map<String, dynamic> toJson() => {
        "blood": blood,
        "vaccine": vaccine,
    };
}
