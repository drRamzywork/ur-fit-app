// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_recipe_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchRecipeImpl _$$SearchRecipeImplFromJson(Map<String, dynamic> json) =>
    _$SearchRecipeImpl(
      query: json['query'] as String?,
      type: json['type'] as String?,
      maxReadyTime: json['maxReadyTime'] as num?,
      includeIngredients: (json['includeIngredients'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      minCalories: json['minCalories'] as num?,
      maxCalories: json['maxCalories'] as num?,
      number: (json['number'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$SearchRecipeImplToJson(_$SearchRecipeImpl instance) =>
    <String, dynamic>{
      'query': instance.query,
      'type': instance.type,
      'maxReadyTime': instance.maxReadyTime,
      'includeIngredients': instance.includeIngredients,
      'minCalories': instance.minCalories,
      'maxCalories': instance.maxCalories,
      'number': instance.number,
    };
