import 'package:freezed_annotation/freezed_annotation.dart';

part 'route_model.freezed.dart';
part 'route_model.g.dart';

@freezed
class RouteModel with _$RouteModel {
  const factory RouteModel({
    required List<double> start,
    required List<double> goal,
    required List<List<double>> path,
  }) = _RouteModel;

  factory RouteModel.fromJson(Map<String, dynamic> json) =>
      _$RouteModelFromJson(json);
}
