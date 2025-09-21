// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppUserModel _$AppUserModelFromJson(Map<String, dynamic> json) => AppUserModel(
  id: json['id'] as String,
  email: json['email'] as String,
  displayName: json['displayName'] as String?,
  photoUrl: json['photoUrl'] as String?,
  createdAt: DateTime.parse(json['createdAt'] as String),
  lastLoginAt: DateTime.parse(json['lastLoginAt'] as String),
  childName: json['childName'] as String?,
  childBirthDate: json['childBirthDate'] == null
      ? null
      : DateTime.parse(json['childBirthDate'] as String),
  learningLanguages:
      (json['learningLanguages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  notificationsEnabled: json['notificationsEnabled'] as bool? ?? true,
);

Map<String, dynamic> _$AppUserModelToJson(AppUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'displayName': instance.displayName,
      'photoUrl': instance.photoUrl,
      'createdAt': instance.createdAt.toIso8601String(),
      'lastLoginAt': instance.lastLoginAt.toIso8601String(),
      'childName': instance.childName,
      'childBirthDate': instance.childBirthDate?.toIso8601String(),
      'learningLanguages': instance.learningLanguages,
      'notificationsEnabled': instance.notificationsEnabled,
    };
