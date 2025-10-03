import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flexlingua_app/data/repositories/auth_repository_impl.dart';
import 'package:flexlingua_app/data/repositories/content_repository_impl.dart';
import 'package:flexlingua_app/data/sources/local/content_local_data_source.dart';
import 'package:flexlingua_app/data/sources/remote/content_remote_data_source.dart';
import 'package:flexlingua_app/firebase_options.dart';
import 'package:flexlingua_app/presentation/app/app.dart';
import 'package:flexlingua_app/presentation/providers/auth_provider.dart';
import 'package:flexlingua_app/presentation/providers/content_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final prefs = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        authRepositoryProvider.overrideWithValue(
          AuthRepositoryImpl(FirebaseAuth.instance),
        ),
        contentRepositoryProvider.overrideWithValue(
          ContentRepositoryImpl(
            ContentRemoteDataSourceImpl(FirebaseFirestore.instance),
            ContentLocalDataSourceImpl(prefs),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
