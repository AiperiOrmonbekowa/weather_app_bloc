import 'dart:convert';
import 'main_model.dart';
import 'weather.dart';

class WeatherResponse {
  WeatherResponse({
    required this.weather,
    required this.main,
    required this.name,
  });

  final List<Weather> weather;
  final Main main;
  final String name;

  factory WeatherResponse.fromMap(Map<String, dynamic> map) {
    return WeatherResponse(
      weather: List<Weather>.from(
        (map['weather'] as List<dynamic>).map<Weather>(
          (x) => Weather.fromJson(x as Map<String, dynamic>),
        ),
      ),
      main: Main.fromJson(map['main'] as Map<String, dynamic>),
      name: map['name'] as String,
    );
  }
  factory WeatherResponse.fromJson(String source) =>
      WeatherResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}
