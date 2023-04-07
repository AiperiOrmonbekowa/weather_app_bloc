// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'weather_cubit.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherSuccess extends WeatherState {
  WeatherSuccess(this.weatherResponse);
  final WeatherResponse weatherResponse;
}

class WeatherError extends WeatherState {
  WeatherError(this.erorText);
  final String erorText;
}
