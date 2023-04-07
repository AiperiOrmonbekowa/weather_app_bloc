import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc/cubit/weather_cubit.dart';
import 'package:weather_bloc/models/weather_response.dart';
import 'package:weather_bloc/services/fetch_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          WeatherCubit(weatherService)..getWeatherByCityName('osh'),
      child: const HomeViewState(),
    );
  }
}

class HomeViewState extends StatelessWidget {
  const HomeViewState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is WeatherInitial) {
              return const Text('WeatherInitial');
            } else if (state is WeatherLoading) {
              return const CircularProgressIndicator();
            } else if (state is WeatherSuccess) {
              return WeatherSuccessWidget(state.weatherResponse);
            } else if (state is WeatherError) {
              return const Text('WeatherSuccess');
            } else {
              return const Text('Bilbedim');
            }
          },
        ),
      ),
    );
  }
}

class WeatherSuccessWidget extends StatelessWidget {
  const WeatherSuccessWidget(this.weatherResponse, {super.key});

  final WeatherResponse weatherResponse;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(weatherResponse.name),
          Text(weatherResponse.weather[0].id.toString()),
          Text(weatherResponse.weather[0].description.toString()),
          Text(weatherResponse.weather[0].main.toString()),
          Text(weatherResponse.weather[0].icon.toString()),
          Text(weatherResponse.main.temp.toString()),
          Text(weatherResponse.main.feelsLike.toString()),
          Text(weatherResponse.main.tempMax.toString()),
          Text(weatherResponse.main.tempMin.toString()),
        ],
      ),
    );
  }
}
