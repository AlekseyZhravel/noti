import 'dart:convert';

List<SelectTriggerModel> savedTriggerListFromJson(String str) =>
    List<SelectTriggerModel>.from(
        json.decode(str).map((x) => SelectTriggerModel.fromJson(x)));
String savedTriggerListToJson(List<SelectTriggerModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SelectTriggerModel {
  String title;
  bool oneItem;
  bool open;
  bool checkBox;
  List<SelectTriggerModel>? child;

  SelectTriggerModel({
    required this.title,
    List<SelectTriggerModel>? child,
    this.open = false,
    this.oneItem = false,
    this.checkBox = false,
  }) : child = child ?? [];

  @override
  String toString() {
    return title;
  }

  Map<String, dynamic> toJson() => {
        "title": title,
        "open": open,
        "oneItem": oneItem,
        "checkBox": checkBox,
        "child":
            child == null ? [] : child!.map((item) => item.toJson()).toList(),
      };

  factory SelectTriggerModel.fromJson(Map<String, dynamic> json) =>
      SelectTriggerModel(
        title: json['title'],
        open: json['open'],
        oneItem: json['oneItem'],
        checkBox: json['checkBox'],
        child: List<SelectTriggerModel>.from(
            (json["child"]).map((x) => SelectTriggerModel.fromJson(x))),
      );
}
