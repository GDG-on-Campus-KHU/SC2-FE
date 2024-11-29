// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RouteResponseImpl _$$RouteResponseImplFromJson(Map<String, dynamic> json) =>
    _$RouteResponseImpl(
      start: (json['start'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      goal: (json['goal'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      path: (json['path'] as List<dynamic>)
          .map((e) =>
              (e as List<dynamic>).map((e) => (e as num).toDouble()).toList())
          .toList(),
    );

Map<String, dynamic> _$$RouteResponseImplToJson(_$RouteResponseImpl instance) =>
    <String, dynamic>{
      'start': instance.start,
      'goal': instance.goal,
      'path': instance.path,
    };
