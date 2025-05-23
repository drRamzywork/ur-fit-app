// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'static_page_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StaticPageModel _$StaticPageModelFromJson(Map<String, dynamic> json) {
  return _StaticPageModel.fromJson(json);
}

/// @nodoc
mixin _$StaticPageModel {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get key => throw _privateConstructorUsedError;

  /// Serializes this StaticPageModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StaticPageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StaticPageModelCopyWith<StaticPageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StaticPageModelCopyWith<$Res> {
  factory $StaticPageModelCopyWith(
          StaticPageModel value, $Res Function(StaticPageModel) then) =
      _$StaticPageModelCopyWithImpl<$Res, StaticPageModel>;
  @useResult
  $Res call({int id, String title, String content, String key});
}

/// @nodoc
class _$StaticPageModelCopyWithImpl<$Res, $Val extends StaticPageModel>
    implements $StaticPageModelCopyWith<$Res> {
  _$StaticPageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StaticPageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? key = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StaticPageModelImplCopyWith<$Res>
    implements $StaticPageModelCopyWith<$Res> {
  factory _$$StaticPageModelImplCopyWith(_$StaticPageModelImpl value,
          $Res Function(_$StaticPageModelImpl) then) =
      __$$StaticPageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String title, String content, String key});
}

/// @nodoc
class __$$StaticPageModelImplCopyWithImpl<$Res>
    extends _$StaticPageModelCopyWithImpl<$Res, _$StaticPageModelImpl>
    implements _$$StaticPageModelImplCopyWith<$Res> {
  __$$StaticPageModelImplCopyWithImpl(
      _$StaticPageModelImpl _value, $Res Function(_$StaticPageModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of StaticPageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? key = null,
  }) {
    return _then(_$StaticPageModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StaticPageModelImpl implements _StaticPageModel {
  const _$StaticPageModelImpl(
      {required this.id,
      required this.title,
      required this.content,
      required this.key});

  factory _$StaticPageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StaticPageModelImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String content;
  @override
  final String key;

  @override
  String toString() {
    return 'StaticPageModel(id: $id, title: $title, content: $content, key: $key)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StaticPageModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.key, key) || other.key == key));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, content, key);

  /// Create a copy of StaticPageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StaticPageModelImplCopyWith<_$StaticPageModelImpl> get copyWith =>
      __$$StaticPageModelImplCopyWithImpl<_$StaticPageModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StaticPageModelImplToJson(
      this,
    );
  }
}

abstract class _StaticPageModel implements StaticPageModel {
  const factory _StaticPageModel(
      {required final int id,
      required final String title,
      required final String content,
      required final String key}) = _$StaticPageModelImpl;

  factory _StaticPageModel.fromJson(Map<String, dynamic> json) =
      _$StaticPageModelImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get content;
  @override
  String get key;

  /// Create a copy of StaticPageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StaticPageModelImplCopyWith<_$StaticPageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
