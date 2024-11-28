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

Shelter _$ShelterFromJson(Map<String, dynamic> json) {
  return _Shelter.fromJson(json);
}

/// @nodoc
mixin _$Shelter {
  String get title => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get telephone => throw _privateConstructorUsedError;
  @JsonKey(name: 'roadAddress')
  String get address => throw _privateConstructorUsedError;
  String get mapx => throw _privateConstructorUsedError;
  String get mapy => throw _privateConstructorUsedError;

  /// Serializes this Shelter to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Shelter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShelterCopyWith<Shelter> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShelterCopyWith<$Res> {
  factory $ShelterCopyWith(Shelter value, $Res Function(Shelter) then) =
      _$ShelterCopyWithImpl<$Res, Shelter>;
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
class _$ShelterCopyWithImpl<$Res, $Val extends Shelter>
    implements $ShelterCopyWith<$Res> {
  _$ShelterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Shelter
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
abstract class _$$ShelterImplCopyWith<$Res> implements $ShelterCopyWith<$Res> {
  factory _$$ShelterImplCopyWith(
          _$ShelterImpl value, $Res Function(_$ShelterImpl) then) =
      __$$ShelterImplCopyWithImpl<$Res>;
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
class __$$ShelterImplCopyWithImpl<$Res>
    extends _$ShelterCopyWithImpl<$Res, _$ShelterImpl>
    implements _$$ShelterImplCopyWith<$Res> {
  __$$ShelterImplCopyWithImpl(
      _$ShelterImpl _value, $Res Function(_$ShelterImpl) _then)
      : super(_value, _then);

  /// Create a copy of Shelter
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
    return _then(_$ShelterImpl(
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
class _$ShelterImpl implements _Shelter {
  const _$ShelterImpl(
      {required this.title,
      required this.category,
      required this.description,
      required this.telephone,
      @JsonKey(name: 'roadAddress') required this.address,
      required this.mapx,
      required this.mapy});

  factory _$ShelterImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShelterImplFromJson(json);

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
    return 'Shelter(title: $title, category: $category, description: $description, telephone: $telephone, address: $address, mapx: $mapx, mapy: $mapy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShelterImpl &&
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

  /// Create a copy of Shelter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShelterImplCopyWith<_$ShelterImpl> get copyWith =>
      __$$ShelterImplCopyWithImpl<_$ShelterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShelterImplToJson(
      this,
    );
  }
}

abstract class _Shelter implements Shelter {
  const factory _Shelter(
      {required final String title,
      required final String category,
      required final String description,
      required final String telephone,
      @JsonKey(name: 'roadAddress') required final String address,
      required final String mapx,
      required final String mapy}) = _$ShelterImpl;

  factory _Shelter.fromJson(Map<String, dynamic> json) = _$ShelterImpl.fromJson;

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

  /// Create a copy of Shelter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShelterImplCopyWith<_$ShelterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
