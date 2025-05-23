// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nutrition_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NutritionModel _$NutritionModelFromJson(Map<String, dynamic> json) {
  return _Nutrition.fromJson(json);
}

/// @nodoc
mixin _$NutritionModel {
  String get name => throw _privateConstructorUsedError;
  num get amount => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;

  /// Serializes this NutritionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NutritionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NutritionModelCopyWith<NutritionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NutritionModelCopyWith<$Res> {
  factory $NutritionModelCopyWith(
          NutritionModel value, $Res Function(NutritionModel) then) =
      _$NutritionModelCopyWithImpl<$Res, NutritionModel>;
  @useResult
  $Res call({String name, num amount, String unit});
}

/// @nodoc
class _$NutritionModelCopyWithImpl<$Res, $Val extends NutritionModel>
    implements $NutritionModelCopyWith<$Res> {
  _$NutritionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NutritionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? amount = null,
    Object? unit = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NutritionImplCopyWith<$Res>
    implements $NutritionModelCopyWith<$Res> {
  factory _$$NutritionImplCopyWith(
          _$NutritionImpl value, $Res Function(_$NutritionImpl) then) =
      __$$NutritionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, num amount, String unit});
}

/// @nodoc
class __$$NutritionImplCopyWithImpl<$Res>
    extends _$NutritionModelCopyWithImpl<$Res, _$NutritionImpl>
    implements _$$NutritionImplCopyWith<$Res> {
  __$$NutritionImplCopyWithImpl(
      _$NutritionImpl _value, $Res Function(_$NutritionImpl) _then)
      : super(_value, _then);

  /// Create a copy of NutritionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? amount = null,
    Object? unit = null,
  }) {
    return _then(_$NutritionImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NutritionImpl implements _Nutrition {
  const _$NutritionImpl(
      {required this.name, required this.amount, required this.unit});

  factory _$NutritionImpl.fromJson(Map<String, dynamic> json) =>
      _$$NutritionImplFromJson(json);

  @override
  final String name;
  @override
  final num amount;
  @override
  final String unit;

  @override
  String toString() {
    return 'NutritionModel(name: $name, amount: $amount, unit: $unit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NutritionImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.unit, unit) || other.unit == unit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, amount, unit);

  /// Create a copy of NutritionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NutritionImplCopyWith<_$NutritionImpl> get copyWith =>
      __$$NutritionImplCopyWithImpl<_$NutritionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NutritionImplToJson(
      this,
    );
  }
}

abstract class _Nutrition implements NutritionModel {
  const factory _Nutrition(
      {required final String name,
      required final num amount,
      required final String unit}) = _$NutritionImpl;

  factory _Nutrition.fromJson(Map<String, dynamic> json) =
      _$NutritionImpl.fromJson;

  @override
  String get name;
  @override
  num get amount;
  @override
  String get unit;

  /// Create a copy of NutritionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NutritionImplCopyWith<_$NutritionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NutritionsModel _$NutritionsModelFromJson(Map<String, dynamic> json) {
  return _Nutritions.fromJson(json);
}

/// @nodoc
mixin _$NutritionsModel {
  List<NutritionModel> get nutrients => throw _privateConstructorUsedError;

  /// Serializes this NutritionsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NutritionsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NutritionsModelCopyWith<NutritionsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NutritionsModelCopyWith<$Res> {
  factory $NutritionsModelCopyWith(
          NutritionsModel value, $Res Function(NutritionsModel) then) =
      _$NutritionsModelCopyWithImpl<$Res, NutritionsModel>;
  @useResult
  $Res call({List<NutritionModel> nutrients});
}

/// @nodoc
class _$NutritionsModelCopyWithImpl<$Res, $Val extends NutritionsModel>
    implements $NutritionsModelCopyWith<$Res> {
  _$NutritionsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NutritionsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nutrients = null,
  }) {
    return _then(_value.copyWith(
      nutrients: null == nutrients
          ? _value.nutrients
          : nutrients // ignore: cast_nullable_to_non_nullable
              as List<NutritionModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NutritionsImplCopyWith<$Res>
    implements $NutritionsModelCopyWith<$Res> {
  factory _$$NutritionsImplCopyWith(
          _$NutritionsImpl value, $Res Function(_$NutritionsImpl) then) =
      __$$NutritionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<NutritionModel> nutrients});
}

/// @nodoc
class __$$NutritionsImplCopyWithImpl<$Res>
    extends _$NutritionsModelCopyWithImpl<$Res, _$NutritionsImpl>
    implements _$$NutritionsImplCopyWith<$Res> {
  __$$NutritionsImplCopyWithImpl(
      _$NutritionsImpl _value, $Res Function(_$NutritionsImpl) _then)
      : super(_value, _then);

  /// Create a copy of NutritionsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nutrients = null,
  }) {
    return _then(_$NutritionsImpl(
      nutrients: null == nutrients
          ? _value._nutrients
          : nutrients // ignore: cast_nullable_to_non_nullable
              as List<NutritionModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NutritionsImpl implements _Nutritions {
  const _$NutritionsImpl({required final List<NutritionModel> nutrients})
      : _nutrients = nutrients;

  factory _$NutritionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$NutritionsImplFromJson(json);

  final List<NutritionModel> _nutrients;
  @override
  List<NutritionModel> get nutrients {
    if (_nutrients is EqualUnmodifiableListView) return _nutrients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nutrients);
  }

  @override
  String toString() {
    return 'NutritionsModel(nutrients: $nutrients)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NutritionsImpl &&
            const DeepCollectionEquality()
                .equals(other._nutrients, _nutrients));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_nutrients));

  /// Create a copy of NutritionsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NutritionsImplCopyWith<_$NutritionsImpl> get copyWith =>
      __$$NutritionsImplCopyWithImpl<_$NutritionsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NutritionsImplToJson(
      this,
    );
  }
}

abstract class _Nutritions implements NutritionsModel {
  const factory _Nutritions({required final List<NutritionModel> nutrients}) =
      _$NutritionsImpl;

  factory _Nutritions.fromJson(Map<String, dynamic> json) =
      _$NutritionsImpl.fromJson;

  @override
  List<NutritionModel> get nutrients;

  /// Create a copy of NutritionsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NutritionsImplCopyWith<_$NutritionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
