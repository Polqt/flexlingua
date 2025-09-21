import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flexlingua_app/domain/entities/app_user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'app_user_model.g.dart';

@JsonSerializable()
class AppUserModel extends AppUser {
  AppUserModel({
    required super.id,
    required super.email,
    super.displayName,
    super.photoUrl,
    required super.createdAt,
    required super.lastLoginAt,
    super.childName,
    super.childBirthDate,
    super.learningLanguages,
    super.notificationsEnabled,
  });

  factory AppUserModel.fromJson(Map<String, dynamic> json) =>
      _$AppUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$AppUserModelToJson(this);

  factory AppUserModel.fromFirebaseUser(firebase_auth.User firebaseUser) {
    return AppUserModel(
      id: firebaseUser.uid,
      email: firebaseUser.email!,
      displayName: firebaseUser.displayName,
      photoUrl: firebaseUser.photoURL,
      createdAt: firebaseUser.metadata.creationTime ?? DateTime.now(),
      lastLoginAt: firebaseUser.metadata.lastSignInTime ?? DateTime.now(),
    );
  }

  factory AppUserModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return AppUserModel.fromJson({'id': doc.id, ...data});
  }

  AppUser toEntity() => AppUser(
    id: id,
    email: email,
    displayName: displayName,
    photoUrl: photoUrl,
    createdAt: createdAt,
    lastLoginAt: lastLoginAt,
    childName: childName,
    childBirthDate: childBirthDate,
    learningLanguages: learningLanguages,
    notificationsEnabled: notificationsEnabled,
  );
}
