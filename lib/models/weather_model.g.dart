// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeatherModelImpl _$$WeatherModelImplFromJson(Map<String, dynamic> json) =>
    _$WeatherModelImpl(
      temp: (json['temp'] as num?)?.toDouble(),
      cityName: json['cityName'] as String?,
      countryCode: json['countryCode'] as String?,
      weather: json['weather'] == null
          ? null
          : Weather.fromJson(json['weather'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$WeatherModelImplToJson(_$WeatherModelImpl instance) =>
    <String, dynamic>{
      'temp': instance.temp,
      'cityName': instance.cityName,
      'countryCode': instance.countryCode,
      'weather': instance.weather,
    };

_$WeatherImpl _$$WeatherImplFromJson(Map<String, dynamic> json) =>
    _$WeatherImpl(
      code: (json['code'] as num?)?.toInt(),
      icon: json['icon'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$WeatherImplToJson(_$WeatherImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'icon': instance.icon,
      'description': instance.description,
    };
