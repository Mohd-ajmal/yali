// To parse this JSON data, do
//
//     final showOrders = showOrdersFromJson(jsonString);

import 'dart:convert';

ShowOrders showOrdersFromJson(String str) => ShowOrders.fromJson(json.decode(str));

String showOrdersToJson(ShowOrders data) => json.encode(data.toJson());

class ShowOrders {
    ShowOrders({
        required this.data,
    });

    List<Datum> data;

    factory ShowOrders.fromJson(Map<String, dynamic> json) => ShowOrders(
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
        this.receiverId,
        this.vId,
        this.payload,
        this.payloadWeight,
        required this.meta,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
    });

    int id;
    String orderId;
    int userId;
    int senderId;
    int? receiverId;
    int? vId;
    dynamic payload;
    dynamic payloadWeight;
    Meta meta;
    String status;
    DateTime createdAt;
    DateTime updatedAt;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        orderId: json["order_id"],
        userId: json["user_id"],
        senderId: json["sender_id"],
        receiverId: json["receiver_id"],
        vId: json["v_id"],
        payload: json["payload"],
        payloadWeight: json["payload_weight"],
        meta: Meta.fromJson(json["meta"]),
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
        "payload": payload,
        "payload_weight": payloadWeight,
        "meta": meta.toJson(),
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

class Meta {
    Meta({
        this.vehicleStatus,
    });

    dynamic vehicleStatus;

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        vehicleStatus: json["vehicle_status"],
    );

    Map<String, dynamic> toJson() => {
        "vehicle_status": vehicleStatus,
    };
}
