class PushModel {
  PushModel({
    required this.title,
    required this.body,
    required this.payload,
    required this.date,
  });

  String title;
  String body;
  Map<String, dynamic>? payload;
  DateTime? date;

  @override
  String toString() {
    return 'name:$title,date:$date,body:$body';
  }
}
