import 'dart:convert';

NotificationModel notificationDataFromJson(String str) =>
    NotificationModel.fromJson(json.decode(str));

String notificationDataToJson(NotificationModel notificationModel) =>
    jsonEncode(notificationModel.toJson());

class NotificationModel {
  List<NotificationData> list;

  NotificationModel({
    required this.list,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        list: json["list"] == null
            ? <NotificationData>[]
            : List<NotificationData>.from(
                json["list"].map((x) => NotificationData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
      };
}

class NotificationData {
  late String id;
  late String message;
  late String type;
  String? icon;
  int? backgroundColor;
  late DateTime time;

  NotificationData(
      {required this.id,
      required this.message,
      required this.type,
      required this.time,
      this.icon,
      this.backgroundColor});

  factory NotificationData.fromJson(Map<String, dynamic> json) =>
      NotificationData(
        id: json["id"],
        message: json["message"],
        type: json["type"],
        time: DateTime.parse(json["time"]).toLocal(),
        backgroundColor: json["background_color"] == null
            ? null
            : int.tryParse(json["background_color"]),
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "message": message,
        "time": time.toIso8601String(),
        "type": type,
        "background_color": backgroundColor.toString(),
        "icon": icon,
      };

  @override
  bool operator ==(Object other) {
    return other is NotificationData && other.time == time;
  }

  @override
  int get hashCode => id.hashCode;
}
