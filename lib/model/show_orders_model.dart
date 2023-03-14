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

    Data data;

    factory ShowOrders.fromJson(Map<String, dynamic> json) => ShowOrders(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class Data {
    Data({
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

    int id;
    String orderId;
    int userId;
    int senderId;
    int receiverId;
    int vId;
    Payload payload;
    int payloadWeight;
    Meta meta;
    String status;
    DateTime createdAt;
    DateTime updatedAt;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        orderId: json["order_id"],
        userId: json["user_id"],
        senderId: json["sender_id"],
        receiverId: json["receiver_id"],
        vId: json["v_id"],
        payload: Payload.fromJson(json["payload"]),
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
        "payload": payload.toJson(),
        "payload_weight": payloadWeight,
        "meta": meta.toJson(),
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

class Meta {
    Meta({
        this.reason,
    });

    dynamic reason;

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        reason: json["reason"],
    );

    Map<String, dynamic> toJson() => {
        "reason": reason,
    };
}

class Payload {
    Payload({
        required this.blood,
        required this.vaccine,
    });

    int blood;
    int vaccine;

    factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        blood: json["blood"],
        vaccine: json["vaccine"],
    );

    Map<String, dynamic> toJson() => {
        "blood": blood,
        "vaccine": vaccine,
    };
}
