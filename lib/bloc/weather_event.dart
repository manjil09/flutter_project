part of 'weather_bloc.dart';

@freezed
class WeatherEvent with _$WeatherEvent {
  const factory WeatherEvent.fetchWeather({required double lat, required double lon}) = _FetchWeather;
}