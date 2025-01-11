import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class ApiService{
  final Dio _dio = Dio();
  static const String baseUrl = "https://weatherbit-v1-mashape.p.rapidapi.com/current";
  static const String apiKey = "4433b8c9bcmsh567c2114d821c93p1b8766jsncd5d94c028ff";
  static const String apiHost = "weatherbit-v1-mashape.p.rapidapi.com";

  Future<WeatherModel> fetchWeather({required double lat, required double lon}) async {
    try {
      final response = await _dio.get(
        baseUrl,
        queryParameters: {"lat": lat, "lon": lon},
        options: Options(
          headers: {
            "X-RapidAPI-Key": apiKey,
            "X-RapidAPI-Host": apiHost,
          },
        ),
      );
      if (response.statusCode == 200){
        final weatherData = response.data['data'][0];
        return WeatherModel.fromJson(weatherData);
      }else{
        throw Exception('Failed to fetch weather data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception("Failed to fetch weather: $e");
    }
  }
}