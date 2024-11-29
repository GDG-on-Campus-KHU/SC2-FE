// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RouteModelImpl _$$RouteModelImplFromJson(Map<String, dynamic> json) =>
    _$RouteModelImpl(
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

Map<String, dynamic> _$$RouteModelImplToJson(_$RouteModelImpl instance) =>
    <String, dynamic>{
      'start': instance.start,
      'goal': instance.goal,
      'path': instance.path,
    };
