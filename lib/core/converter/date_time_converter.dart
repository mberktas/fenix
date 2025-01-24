import 'package:json_annotation/json_annotation.dart';

class DateTimeConverter implements JsonConverter<DateTime?, String?> {
  const DateTimeConverter();

  @override
  DateTime? fromJson(String? json) {
    if (json == null || json.isEmpty) {
      return null; // Boş string veya null ise null döner
    }
    return DateTime.parse(json); // Geçerli bir tarih formatında ise döner
  }

  @override
  String? toJson(DateTime? date) {
    return date?.toIso8601String(); // DateTime'ı ISO formatında stringe çevirir
  }
}
