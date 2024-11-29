// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RouteModel _$RouteModelFromJson(Map<String, dynamic> json) {
  return _RouteModel.fromJson(json);
}

/// @nodoc
mixin _$RouteModel {
  List<double> get start => throw _privateConstructorUsedError;
  List<double> get goal => throw _privateConstructorUsedError;
  List<List<double>> get path => throw _privateConstructorUsedError;

  /// Serializes this RouteModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RouteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RouteModelCopyWith<RouteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteModelCopyWith<$Res> {
  factory $RouteModelCopyWith(
          RouteModel value, $Res Function(RouteModel) then) =
      _$RouteModelCopyWithImpl<$Res, RouteModel>;
  @useResult
  $Res call({List<double> start, List<double> goal, List<List<double>> path});
}

/// @nodoc
class _$RouteModelCopyWithImpl<$Res, $Val extends RouteModel>
    implements $RouteModelCopyWith<$Res> {
  _$RouteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RouteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
    Object? goal = null,
    Object? path = null,
  }) {
    return _then(_value.copyWith(
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as List<double>,
      goal: null == goal
          ? _value.goal
          : goal // ignore: cast_nullable_to_non_nullable
              as List<double>,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as List<List<double>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RouteModelImplCopyWith<$Res>
    implements $RouteModelCopyWith<$Res> {
  factory _$$RouteModelImplCopyWith(
          _$RouteModelImpl value, $Res Function(_$RouteModelImpl) then) =
      __$$RouteModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<double> start, List<double> goal, List<List<double>> path});
}

/// @nodoc
class __$$RouteModelImplCopyWithImpl<$Res>
    extends _$RouteModelCopyWithImpl<$Res, _$RouteModelImpl>
    implements _$$RouteModelImplCopyWith<$Res> {
  __$$RouteModelImplCopyWithImpl(
      _$RouteModelImpl _value, $Res Function(_$RouteModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of RouteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
    Object? goal = null,
    Object? path = null,
  }) {
    return _then(_$RouteModelImpl(
      start: null == start
          ? _value._start
          : start // ignore: cast_nullable_to_non_nullable
              as List<double>,
      goal: null == goal
          ? _value._goal
          : goal // ignore: cast_nullable_to_non_nullable
              as List<double>,
      path: null == path
          ? _value._path
          : path // ignore: cast_nullable_to_non_nullable
              as List<List<double>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RouteModelImpl implements _RouteModel {
  const _$RouteModelImpl(
      {required final List<double> start,
      required final List<double> goal,
      required final List<List<double>> path})
      : _start = start,
        _goal = goal,
        _path = path;

  factory _$RouteModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RouteModelImplFromJson(json);

  final List<double> _start;
  @override
  List<double> get start {
    if (_start is EqualUnmodifiableListView) return _start;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_start);
  }

  final List<double> _goal;
  @override
  List<double> get goal {
    if (_goal is EqualUnmodifiableListView) return _goal;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_goal);
  }

  final List<List<double>> _path;
  @override
  List<List<double>> get path {
    if (_path is EqualUnmodifiableListView) return _path;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_path);
  }

  @override
  String toString() {
    return 'RouteModel(start: $start, goal: $goal, path: $path)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteModelImpl &&
            const DeepCollectionEquality().equals(other._start, _start) &&
            const DeepCollectionEquality().equals(other._goal, _goal) &&
            const DeepCollectionEquality().equals(other._path, _path));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_start),
      const DeepCollectionEquality().hash(_goal),
      const DeepCollectionEquality().hash(_path));

  /// Create a copy of RouteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RouteModelImplCopyWith<_$RouteModelImpl> get copyWith =>
      __$$RouteModelImplCopyWithImpl<_$RouteModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RouteModelImplToJson(
      this,
    );
  }
}

abstract class _RouteModel implements RouteModel {
  const factory _RouteModel(
      {required final List<double> start,
      required final List<double> goal,
      required final List<List<double>> path}) = _$RouteModelImpl;

  factory _RouteModel.fromJson(Map<String, dynamic> json) =
      _$RouteModelImpl.fromJson;

  @override
  List<double> get start;
  @override
  List<double> get goal;
  @override
  List<List<double>> get path;

  /// Create a copy of RouteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RouteModelImplCopyWith<_$RouteModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
