import 'package:firebase_auth/firebase_auth.dart';
import 'package:flexlingua_app/data/repositories/auth_repository_impl.dart';
import 'package:flexlingua_app/domain/entities/app_user.dart';
import 'package:flexlingua_app/domain/repositories/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(FirebaseAuth.instance);
});

final authStateProvider = StreamProvider((ref) {
  final authRepo = ref.watch(authRepositoryProvider);
  return authRepo.authStateChanges;
});

class AuthNotifier extends StateNotifier<AsyncValue<AppUser?>> {
  final AuthRepository _authRepository;

  AuthNotifier(this._authRepository) : super(const AsyncValue.loading());

  Future<void> signIn(String email, String password) async {
    state = const AsyncValue.loading();

    try {
      final user = await _authRepository.signInWithEmail(email, password);
      state = AsyncValue.data(user);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> signUp(String email, String password) async {
    state = const AsyncValue.loading();

    try {
      final user = await _authRepository.signUpWithEmail(email, password);
      state = AsyncValue.data(user);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> signOut() async {
    state = const AsyncValue.loading();

    try {
      await _authRepository.signOut();
      state = const AsyncValue.data(null);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}

final authNotifierProvider = StateNotifierProvider((ref) {
  final authRepo = ref.watch(authRepositoryProvider);
  return AuthNotifier(authRepo);
});
