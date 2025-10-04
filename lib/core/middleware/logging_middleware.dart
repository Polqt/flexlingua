import 'dart:developer' as dev;

class LoggingMiddleware {
  Future<T> logOperation<T>(
    String operation,
    Future<T> Function() func, {
    Map<String, dynamic>? metadata,
  }) async {
    final startTime = DateTime.now();

    try {
      final result = await func();
      final duration = DateTime.now().difference(startTime);
      dev.log(
        'Operation "$operation" completed in ${duration.inMilliseconds} ms',
        name: 'LoggingMiddleware',
        time: startTime,
        sequenceNumber: null,
        level: 800,
        zone: null,
      );
      return result;
    } catch (e, stackTrace) {
      final duration = DateTime.now().difference(startTime);
      dev.log(
        'Failed operation "$operation" after ${duration.inMilliseconds} ms: $e',
        name: 'Firebase',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  void logAuthState(String state, {String? userId}) {
    dev.log(
      'Auth State Change: $state${userId != null ? ' for user $userId' : ''}',
      name: 'LoggingMiddleware',
      time: DateTime.now(),
      sequenceNumber: null,
      level: 800,
      zone: null,
    );
  }
}
