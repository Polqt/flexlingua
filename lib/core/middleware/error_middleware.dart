import 'package:firebase_auth/firebase_auth.dart';

class ErrorMiddleware {
  Exception handleAuthError(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return Exception('The email address is not valid.');
      case 'user-disabled':
        return Exception(
          'The user corresponding to the given email has been disabled.',
        );
      case 'user-not-found':
        return Exception('No user found for the given email.');
      case 'wrong-password':
        return Exception('The password is invalid for the given email.');
      case 'email-already-in-use':
        return Exception('The email is already in use by another account.');
      case 'operation-not-allowed':
        return Exception('Email/password accounts are not enabled.');
      case 'weak-password':
        return Exception('The password is too weak.');
      default:
        return Exception('An undefined Error happened: ${e.message}');
    }
  }

  Exception handleFirestoreError(FirebaseException e) {
    switch (e.code) {
      case 'cancelled':
        return Exception('The operation was cancelled.');
      case 'unknown':
        return Exception('An unknown error occurred.');
      case 'invalid-argument':
        return Exception('An invalid argument was provided.');
      case 'deadline-exceeded':
        return Exception('The operation took too long to complete.');
      case 'not-found':
        return Exception('The requested document was not found.');
      case 'already-exists':
        return Exception('The document already exists.');
      case 'permission-denied':
        return Exception(
          'You do not have permission to perform this operation.',
        );
      case 'resource-exhausted':
        return Exception(
          'Resource has been exhausted, please try again later.',
        );
      case 'failed-precondition':
        return Exception(
          'The operation was rejected because the system is not in a state required for the operation\'s execution.',
        );
      case 'aborted':
        return Exception(
          'The operation was aborted, typically due to a concurrency issue.',
        );
      case 'out-of-range':
        return Exception('The operation was attempted past the valid range.');
      case 'unimplemented':
        return Exception(
          'The operation is not implemented or not supported/enabled.',
        );
      case 'internal':
        return Exception(
          'An internal error occurred in the Firestore service.',
        );
      case 'unavailable':
        return Exception(
          'The service is currently unavailable. Please try again later.',
        );
      case 'data-loss':
        return Exception('Unrecoverable data loss or corruption occurred.');
      case 'unauthenticated':
        return Exception(
          'The request does not have valid authentication credentials for the operation.',
        );
      default:
        return Exception('An undefined Error happened: ${e.message}');
    }
  }
}
