import 'package:weather_app/models/weather_model.dart';

import '../services/api_service.dart';

class WeatherRepository {
  final ApiService _apiService = ApiService();

  Future<WeatherModel> getWeather(double lat, double lon) {
    return _apiService.fetchWeather(lat: lat, lon: lon);
  }
}