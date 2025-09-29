import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flexlingua_app/data/models/app_user_model.dart';
import 'package:flexlingua_app/domain/entities/app_user.dart';
import 'package:flexlingua_app/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final firebase_auth.FirebaseAuth _firebaseAuth;

  AuthRepositoryImpl(this._firebaseAuth);

  @override
  Future<AppUser?> getCurrentUser() async {
    final user = _firebaseAuth.currentUser;
    return user != null ? AppUserModel.fromFirebaseUser(user) : null;
  }

  @override
  Future<AppUser> signInWithEmail(String email, String password) async {
    final result = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return AppUserModel.fromFirebaseUser(result.user!);
  }

  @override
  Future<AppUser> signUpWithEmail(
    String email,
    String password, {
    String? childName,
    DateTime? childBirthDate,
    List<String>? learningLanguages,
  }) async {
    final result = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    final user = result.user!;
    final appUser = AppUserModel(
      id: user.uid,
      email: email,
      createdAt: user.metadata.creationTime ?? DateTime.now(),
      lastLoginAt: user.metadata.lastSignInTime ?? DateTime.now(),
      childName: childName,
      childBirthDate: childBirthDate,
      learningLanguages: learningLanguages,
    );

    await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .set(appUser.toJson());

    return appUser;
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<void> updateProfile({
    String? displayName,
    String? photoURL,
    String? childName,
    String? childBirthDate,
  }) async {
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      await user.updateDisplayName(displayName);
      await user.updatePhotoURL(photoURL);
      await user.reload();

      final docRef = FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid);
      final data = <String, dynamic>{};

      if (displayName != null) data['displayName'] = displayName;
      if (photoURL != null) data['photoUrl'] = photoURL;
      if (childName != null) data['childName'] = childName;
      if (childBirthDate != null) data['childBirthDate'] = childBirthDate;
      await docRef.update(data);
    }
  }

  @override
  Future<void> sendEmailResetPassword(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  @override
  Stream<AppUser?> get authStateChanges {
    return _firebaseAuth.authStateChanges().map((user) {
      return user != null ? AppUserModel.fromFirebaseUser(user) : null;
    });
  }
}
