import 'dart:async';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:bloc_weather_app/model/weather.dart';
import './bloc.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  @override
  WeatherState get initialState => WeatherInitial();

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if (event is GetWeather) {
      yield WeatherLoading();
      final weather = await _fetchWatherFromFakeApi(event.cityName);
      yield WeatherLoaded(weather);
    }
  }

  Future<Weather> _fetchWatherFromFakeApi(String cityName) {
    return Future.delayed(Duration(seconds: 2), () {
      return Weather(
          cityName: cityName,
          temperature: 20 + Random().nextInt(15) + Random().nextDouble());
    });
  }
}
