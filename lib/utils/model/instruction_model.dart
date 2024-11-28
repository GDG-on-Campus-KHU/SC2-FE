import 'package:freezed_annotation/freezed_annotation.dart';

part 'instruction_model.freezed.dart';
part 'instruction_model.g.dart';

@freezed
class SafetyInstruction with _$SafetyInstruction {
  const factory SafetyInstruction({
    @JsonKey(name: 'safety_cate_nm2') required String safetyCateNm2,
    @JsonKey(name: 'actRmks') String? actRmks,
    @JsonKey(name: 'safety_cate_nm3') required String safetyCateNm3,
    @JsonKey(name: 'safety_cate4') String? safetyCate4,
    @JsonKey(name: 'safety_cate3') required String safetyCate3,
    @JsonKey(name: 'safety_cate2') required String safetyCate2,
    @JsonKey(name: 'safety_cate1') required String safetyCate1,
    @JsonKey(name: 'contentsUrl') String? contentsUrl,
    @JsonKey(name: 'safety_cate_nm1') required String safetyCateNm1,
  }) = _SafetyInstruction;

  factory SafetyInstruction.fromJson(Map<String, dynamic> json) =>
      _$SafetyInstructionFromJson(json);
}
