import 'package:freezed_annotation/freezed_annotation.dart';

part 'shelter_model.freezed.dart';
part 'shelter_model.g.dart';

@freezed
class Shelter with _$Shelter {
  const factory Shelter({
    required String title,
    required String category,
    required String description,
    required String telephone,
    @JsonKey(name: 'roadAddress') required String address,
    required String mapx,
    required String mapy,
  }) = _Shelter;

  factory Shelter.fromJson(Map<String, dynamic> json) =>
      _$ShelterFromJson(json);
}
