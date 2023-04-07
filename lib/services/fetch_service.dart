import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:weather_bloc/constants/api_const.dart';
import '../models/weather_response.dart';

class WeatherService {
  final client = http.Client();

  Future<WeatherResponse?> getWeatherByCityName(String cityName) async {
    final uri = Uri.parse(ApiConst.weatherByCityName(cityName));
    try {
      final response = await client.get(uri);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final weather = WeatherResponse.fromJson(response.body);
        return weather;
      } else {
        log('response.statusCode: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      log('getWeatherByCityName metodunda bir kata boldu $e');
      return null;
    }
  }
}

final weatherService = WeatherService();
