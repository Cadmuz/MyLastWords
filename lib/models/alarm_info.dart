class AlarmInfo {
  int id;
  String title;
  DateTime alarmDateTime;
  bool isPending;

  AlarmInfo({
    required this.id,
    required this.title,
    required this.alarmDateTime,
    required this.isPending,
  });

  factory AlarmInfo.fromMap(Map<String, dynamic> json) => AlarmInfo(
        id: json["id"],
        title: json["title"],
        alarmDateTime: DateTime.parse(json["alarmDateTime"]),
        isPending: json["isPending"],
      );
  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "alarmDateTime": alarmDateTime.toIso8601String(),
        "isPending": isPending,
      };
}
