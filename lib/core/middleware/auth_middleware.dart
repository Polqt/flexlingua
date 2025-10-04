import 'package:firebase_auth/firebase_auth.dart';
import 'package:flexlingua_app/core/errors/exceptions.dart';

class AuthMiddleware {
  final FirebaseAuth _auth;

  AuthMiddleware(this._auth);

  Future<String> getValidToken() async {
    final user = _auth.currentUser;
    if (user == null) {
      throw UnauthorizedException('User not authenticated');
    }

    final token = await user.getIdToken();
    if (token == null || token.isEmpty) {
      throw UnauthorizedException('Failed to get authentication token');
    }

    return token;
  }

  Future<T> withAuth<T>(Future<T> Function() operation) async {
    try {
      await getValidToken();
      return await operation();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-token-expired' || e.code == 'user-disabled') {
        throw UnauthorizedException('Authentication token expired or user disabled');
      }
      rethrow;
    }
  }
}
