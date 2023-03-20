import 'dart:convert';

GetRequestedOrders getRequestedOrdersFromJson(String str) => GetRequestedOrders.fromJson(json.decode(str));

String getRequestedOrdersToJson(GetRequestedOrders data) => json.encode(data.toJson());

class GetRequestedOrders {
    GetRequestedOrders({
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
    List<dynamic>? payload;
    int? payloadWeight;
    Meta? meta;
    String? status;
    String? createdAt;
    String? updatedAt;

    factory GetRequestedOrders.fromJson(Map<String, dynamic> json) => GetRequestedOrders(
        id: json["id"],
        orderId: json["order_id"],
        userId: json["user_id"],
        senderId: json["sender_id"],
        receiverId: json["receiver_id"],
        vId: json["v_id"],
        payload: json["payload"],
        payloadWeight: json["payload_weight"],
        meta: Meta.fromJson(json["meta"] ?? {}),
        status: json["status"],
        createdAt: json["created_at"]?? "",
        updatedAt: json["updated_at"] ?? "",
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
        "meta": meta?.toJson() ?? {},
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
    };
}

class Meta {
    Meta({
        required this.vehicleStatus,
    });

    String? vehicleStatus;

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        vehicleStatus: json["vehicle_status"] ?? "",
    );

    Map<String, dynamic> toJson() => {
        "vehicle_status": vehicleStatus,
    };
}

