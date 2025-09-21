import 'package:flexlingua_app/domain/entities/educational_content.dart';
import 'package:json_annotation/json_annotation.dart';

part 'educational_content_model.g.dart';

@JsonSerializable()
class EducationalContentModel extends EducationalContent {
  EducationalContentModel({
    required super.id,
    required super.title,
    required super.description,
    required super.content,
    required super.category,
    required super.tags,
    required super.createdAt,
  });

  factory EducationalContentModel.fromJson(Map<String, dynamic> json) =>
      _$EducationalContentModelFromJson(json);

  Map<String, dynamic> toJson() => _$EducationalContentModelToJson(this);

  factory EducationalContentModel.fromEntity(EducationalContent entity) {
    return EducationalContentModel(
      id: entity.id,
      title: entity.title,
      description: entity.description,
      content: entity.content,
      category: entity.category,
      tags: entity.tags,
      createdAt: entity.createdAt,
    );
  }

  EducationalContent toEntity() {
    return EducationalContent(
      id: id, 
      title: title,
      description: description,
      content: content,
      category: category,
      tags: tags,
      createdAt: createdAt,
    );
  }
}
