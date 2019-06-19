import 'package:bloc_weather_app/model/weather.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class WeatherState extends Equatable {
  WeatherState([List props = const []]) : super(props);
}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLaoded extends WeatherState {
  final Weather weather;

  WeatherLaoded(this.weather) : super([weather]);
}
