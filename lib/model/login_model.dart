// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  final num? success;
  final Data? data;
  final num? userId;
  final String? role;
  final String? message;
  final dynamic error;
  final String? username;

  LoginModel({
    this.success,
    this.data,
    this.userId,
    this.role,
    this.message,
    this.error,
    this.username,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    success: json["success"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    userId: json["user_id"],
    role: json["role"],
    message: json["message"],
    error: json["error"],
    username: json["username"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data?.toJson(),
    "user_id": userId,
    "role": role,
    "message": message,
    "error": error,
    "username": username,
  };
}

class Data {
  final String? refresh;
  final String? access;
  final num? userId;
  final String? role;
  final String? username;
  final String? email;
  final DateTime? lastLogin;

  Data({
    this.refresh,
    this.access,
    this.userId,
    this.role,
    this.username,
    this.email,
    this.lastLogin,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    refresh: json["refresh"],
    access: json["access"],
    userId: json["user_id"],
    role: json["role"],
    username: json["username"],
    email: json["email"],
    lastLogin: json["last_login"] == null ? null : DateTime.parse(json["last_login"]),
  );

  Map<String, dynamic> toJson() => {
    "refresh": refresh,
    "access": access,
    "user_id": userId,
    "role": role,
    "username": username,
    "email": email,
    "last_login": lastLogin?.toIso8601String(),
  };
}
