import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_model.freezed.dart';
part 'weather_model.g.dart';

@freezed
class WeatherModel with _$WeatherModel {
  const factory WeatherModel({
    required double? temp, 
    required String? cityName,
    required String? countryCode,
    required Weather? weather, 
  }) = _WeatherModel;

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);
}

@freezed
class Weather with _$Weather {
  const factory Weather({
    required int? code, // Nullable field to handle null
    required String? icon, // Nullable field to handle null
    required String? description, // Nullable field to handle null
  }) = _Weather;

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
}