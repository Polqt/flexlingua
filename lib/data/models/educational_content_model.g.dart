// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'educational_content_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EducationalContentModel _$EducationalContentModelFromJson(
  Map<String, dynamic> json,
) => EducationalContentModel(
  id: json['id'] as String,
  title: json['title'] as String,
  description: json['description'] as String,
  content: json['content'] as String,
  category: json['category'] as String,
  tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$EducationalContentModelToJson(
  EducationalContentModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'content': instance.content,
  'category': instance.category,
  'tags': instance.tags,
  'createdAt': instance.createdAt.toIso8601String(),
};
