
import 'dart:convert';

UserDataModel welcomeFromJson(String str) => UserDataModel.fromJson(json.decode(str));

String welcomeToJson(UserDataModel data) => json.encode(data.toJson());

class UserDataModel {
    UserDataModel({
        required this.userId,
        required this.id,
        required this.title,
        required this.body,
    });

    int userId;
    int id;
    String title;
    String body;

    factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
    };
}
