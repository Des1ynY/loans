import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart' as concurrency;
import 'package:firebase_api/firebase_api.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl_standalone.dart' as intl;
import 'package:loans/src/features/app/widgets/app.dart';
import 'package:loans/src/features/app/widgets/app_scope.dart';
import 'package:loans/src/features/authentication/data/auth_repository.dart';
import 'package:loans/src/features/authentication/widgets/auth_scope.dart';
import 'package:loans/src/shared/utils/logger/bloc_observer.dart';

Future<void> main() async {
  final binding = WidgetsFlutterBinding.ensureInitialized()..deferFirstFrame();

  await Firebase.initializeApp();
  await intl.findSystemLocale();

  Bloc.observer = const BlocLogger();
  Bloc.transformer = concurrency.sequential();

  // Initializing dependencies
  final authRepository = AuthRepository(provider: PhoneAuthProvider());

  binding.allowFirstFrame();
  runApp(
    AppScope(
      authRepository: authRepository,
      child: const AuthScope(child: LoansApp()),
    ),
  );
}
