// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shelter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShelterModelImpl _$$ShelterModelImplFromJson(Map<String, dynamic> json) =>
    _$ShelterModelImpl(
      title: json['title'] as String,
      category: json['category'] as String,
      description: json['description'] as String,
      telephone: json['telephone'] as String,
      address: json['roadAddress'] as String,
      mapx: json['mapx'] as String,
      mapy: json['mapy'] as String,
    );

Map<String, dynamic> _$$ShelterModelImplToJson(_$ShelterModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'category': instance.category,
      'description': instance.description,
      'telephone': instance.telephone,
      'roadAddress': instance.address,
      'mapx': instance.mapx,
      'mapy': instance.mapy,
    };
