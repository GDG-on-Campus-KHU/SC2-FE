import 'package:freezed_annotation/freezed_annotation.dart';

part 'shelter_model.freezed.dart';
part 'shelter_model.g.dart';

@freezed
class ShelterModel with _$ShelterModel {
  const factory ShelterModel({
    required String title,
    @JsonKey(name: 'roadAddress') required String address,
  }) = _ShelterModel;

  factory ShelterModel.fromJson(Map<String, dynamic> json) =>
      _$ShelterModelFromJson(json);
}
