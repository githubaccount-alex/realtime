class TimeModel {
  final String timeValue;
  final int unixTime;
  final String timeZone;

  TimeModel({required this.timeValue, required this.timeZone, required this.unixTime});

  factory TimeModel.fromJsonToModel(Map<String, dynamic> json) {
    return TimeModel(
      timeValue: json["datetime"],
      timeZone: json["timezone"],
      unixTime: json["unixtime"]
    );
  }
}
