import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/weather_bloc.dart';
import '../repositories/weather_repository.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: BlocProvider(
        create: (_) => WeatherBloc(WeatherRepository()),
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            return state.when(
              initial: () => Center(
                child: ElevatedButton(
                  onPressed: () {
                    context
                        .read<WeatherBloc>()
                        .add(const WeatherEvent.fetchWeather(lat: 27, lon: 85));
                  },
                  child: const Text('Fetch Weather'),
                ),
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              loaded: (weather) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Temperature: ${weather.temp}°C',
                      style: const TextStyle(fontSize: 24),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        context.read<WeatherBloc>().add(
                            const WeatherEvent.fetchWeather(
                                lat: 27.7172, lon: 85.324));
                      },
                      child: const Text('Refresh'),
                    ),
                  ],
                ),
              ),
              error: (message) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Error: $message',
                      style: const TextStyle(color: Colors.red, fontSize: 18),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        context.read<WeatherBloc>().add(
                            const WeatherEvent.fetchWeather(
                                lat: 27.7172, lon: 85.324));
                      },
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
