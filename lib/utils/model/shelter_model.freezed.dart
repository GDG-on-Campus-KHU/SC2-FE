// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shelter_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ShelterModel _$ShelterModelFromJson(Map<String, dynamic> json) {
  return _ShelterModel.fromJson(json);
}

/// @nodoc
mixin _$ShelterModel {
  String get title => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get telephone => throw _privateConstructorUsedError;
  @JsonKey(name: 'roadAddress')
  String get address => throw _privateConstructorUsedError;
  String get mapx => throw _privateConstructorUsedError;
  String get mapy => throw _privateConstructorUsedError;

  /// Serializes this ShelterModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ShelterModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShelterModelCopyWith<ShelterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShelterModelCopyWith<$Res> {
  factory $ShelterModelCopyWith(
          ShelterModel value, $Res Function(ShelterModel) then) =
      _$ShelterModelCopyWithImpl<$Res, ShelterModel>;
  @useResult
  $Res call(
      {String title,
      String category,
      String description,
      String telephone,
      @JsonKey(name: 'roadAddress') String address,
      String mapx,
      String mapy});
}

/// @nodoc
class _$ShelterModelCopyWithImpl<$Res, $Val extends ShelterModel>
    implements $ShelterModelCopyWith<$Res> {
  _$ShelterModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShelterModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? category = null,
    Object? description = null,
    Object? telephone = null,
    Object? address = null,
    Object? mapx = null,
    Object? mapy = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      telephone: null == telephone
          ? _value.telephone
          : telephone // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      mapx: null == mapx
          ? _value.mapx
          : mapx // ignore: cast_nullable_to_non_nullable
              as String,
      mapy: null == mapy
          ? _value.mapy
          : mapy // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShelterModelImplCopyWith<$Res>
    implements $ShelterModelCopyWith<$Res> {
  factory _$$ShelterModelImplCopyWith(
          _$ShelterModelImpl value, $Res Function(_$ShelterModelImpl) then) =
      __$$ShelterModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String category,
      String description,
      String telephone,
      @JsonKey(name: 'roadAddress') String address,
      String mapx,
      String mapy});
}

/// @nodoc
class __$$ShelterModelImplCopyWithImpl<$Res>
    extends _$ShelterModelCopyWithImpl<$Res, _$ShelterModelImpl>
    implements _$$ShelterModelImplCopyWith<$Res> {
  __$$ShelterModelImplCopyWithImpl(
      _$ShelterModelImpl _value, $Res Function(_$ShelterModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShelterModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? category = null,
    Object? description = null,
    Object? telephone = null,
    Object? address = null,
    Object? mapx = null,
    Object? mapy = null,
  }) {
    return _then(_$ShelterModelImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      telephone: null == telephone
          ? _value.telephone
          : telephone // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      mapx: null == mapx
          ? _value.mapx
          : mapx // ignore: cast_nullable_to_non_nullable
              as String,
      mapy: null == mapy
          ? _value.mapy
          : mapy // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShelterModelImpl implements _ShelterModel {
  const _$ShelterModelImpl(
      {required this.title,
      required this.category,
      required this.description,
      required this.telephone,
      @JsonKey(name: 'roadAddress') required this.address,
      required this.mapx,
      required this.mapy});

  factory _$ShelterModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShelterModelImplFromJson(json);

  @override
  final String title;
  @override
  final String category;
  @override
  final String description;
  @override
  final String telephone;
  @override
  @JsonKey(name: 'roadAddress')
  final String address;
  @override
  final String mapx;
  @override
  final String mapy;

  @override
  String toString() {
    return 'ShelterModel(title: $title, category: $category, description: $description, telephone: $telephone, address: $address, mapx: $mapx, mapy: $mapy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShelterModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.telephone, telephone) ||
                other.telephone == telephone) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.mapx, mapx) || other.mapx == mapx) &&
            (identical(other.mapy, mapy) || other.mapy == mapy));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, category, description,
      telephone, address, mapx, mapy);

  /// Create a copy of ShelterModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShelterModelImplCopyWith<_$ShelterModelImpl> get copyWith =>
      __$$ShelterModelImplCopyWithImpl<_$ShelterModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShelterModelImplToJson(
      this,
    );
  }
}

abstract class _ShelterModel implements ShelterModel {
  const factory _ShelterModel(
      {required final String title,
      required final String category,
      required final String description,
      required final String telephone,
      @JsonKey(name: 'roadAddress') required final String address,
      required final String mapx,
      required final String mapy}) = _$ShelterModelImpl;

  factory _ShelterModel.fromJson(Map<String, dynamic> json) =
      _$ShelterModelImpl.fromJson;

  @override
  String get title;
  @override
  String get category;
  @override
  String get description;
  @override
  String get telephone;
  @override
  @JsonKey(name: 'roadAddress')
  String get address;
  @override
  String get mapx;
  @override
  String get mapy;

  /// Create a copy of ShelterModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShelterModelImplCopyWith<_$ShelterModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
