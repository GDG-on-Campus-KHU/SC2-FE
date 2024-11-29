import 'package:freezed_annotation/freezed_annotation.dart';

part 'route_model.freezed.dart';
part 'route_model.g.dart';

@freezed
class RouteResponse with _$RouteResponse {
  const factory RouteResponse({
    required List<double> start,
    required List<double> goal,
    required List<List<double>> path,
  }) = _RouteResponse;

  factory RouteResponse.fromJson(Map<String, dynamic> json) =>
      _$RouteResponseFromJson(json);
}
