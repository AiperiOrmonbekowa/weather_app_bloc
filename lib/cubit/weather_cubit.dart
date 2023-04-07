import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc/services/fetch_service.dart';
import '../models/weather_response.dart';
part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherService) : super(WeatherInitial());

  final WeatherService weatherService;
  Future<void> getWeatherByCityName(String cityName) async {
    emit(WeatherLoading());
    final date = await weatherService.getWeatherByCityName(cityName);
    if (date != null) {
      emit(WeatherSuccess(date));
    } else {
      emit(WeatherError('bir kata boldu'));
    }
  }
}
