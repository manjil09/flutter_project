import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/models/weather_model.dart';

import '../repositories/weather_repository.dart';

part 'weather_bloc.freezed.dart';
part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository _repository;

  WeatherBloc(this._repository) : super(const WeatherState.initial()) {
    on<WeatherEvent>((event, emit) async {
      emit(const WeatherState.loading());
      try {
        final weather = await _repository.getWeather(event.lat, event.lon);
        emit(WeatherState.loaded(weather));
      } catch (e) {
        emit(WeatherState.error(e.toString()));
      }
    });
  }
}
