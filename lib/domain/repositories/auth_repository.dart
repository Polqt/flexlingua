import 'package:flexlingua_app/domain/entities/app_user.dart';

abstract class AuthRepository {
  Future<AppUser?> getCurrentUser();
  Future<AppUser> signInWithEmail(String email, String password);
  Future<AppUser> signUpWithEmail(String email, String password);
  Future<void> signOut();
  Future<void> sendEmailResetPassword(String email);

  Future<void> updateProfile({
    String? displayName,
    String? photoURL,
    String? childName,
    String? childBirthDate,
  });

  Stream<AppUser?> get authStateChanges;
}