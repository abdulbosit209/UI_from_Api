// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'input_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InputModel _$InputModelFromJson(Map<String, dynamic> json) => InputModel(
      type: json['type'] as String? ?? '',
      group: json['group'] as String? ?? '',
      sort: json['sort'] as int? ?? 0,
      height: (json['height'] as num?)?.toDouble() ?? 0.0,
      width: (json['width'] as num?)?.toDouble() ?? 0.0,
      title: json['title'] as String? ?? '',
      color: json['color'] as String? ?? '',
    );

Map<String, dynamic> _$InputModelToJson(InputModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'sort': instance.sort,
      'group': instance.group,
      'width': instance.width,
      'height': instance.height,
      'color': instance.color,
      'type': instance.type,
    };
