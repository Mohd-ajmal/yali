import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    LoginModel({
        required this.status,
        required this.message,
        required this.data,
        required this.token,
    });
    int? status;
    String? message;
    Data? data;
    String? token;

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data!.toJson(),
        "token": token,
    };
}

class Data {
    Data({
        required this.status,
        required this.id,
        required this.userName,
        this.profileId,
        required this.email,
        this.emailVerifiedAt,
        required this.isAdmin,
        required this.createdAt,
        required this.updatedAt,
    });

    int? id;
    int? status;
    String? userName;
    dynamic profileId;
    String? email;
    dynamic emailVerifiedAt;
    int? isAdmin;
    DateTime? createdAt;
    DateTime? updatedAt;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
      status: json["status"],
        id: json["id"],
        userName: json["user_name"],
        profileId: json["profile_id"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        isAdmin: json["is_admin"],
        
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_name": userName,
        "profile_id": profileId,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "is_admin": isAdmin,
        "status": status,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
    };
}
