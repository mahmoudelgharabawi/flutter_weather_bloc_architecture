import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/data/models/weather.dart';
import 'package:flutter_application_1/data/repositories/api_service.dart';
import 'package:meta/meta.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial());

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is WeatherGetEvent) {
      yield WeatherLoadingState();
      Weather _weather = await ApiService.getWeather(event.city);
      yield WeatherLoadedState(weather: _weather);
    }
  }
}
