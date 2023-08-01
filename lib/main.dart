import 'package:api/api.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart' as concurrency;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:loans/src/features/app/widgets/app.dart';
import 'package:loans/src/features/app/widgets/app_scope.dart';
import 'package:loans/src/features/authentication/data/auth_repository.dart';
import 'package:loans/src/features/authentication/widgets/auth_scope.dart';

Future<void> main() async {
  final binding = WidgetsFlutterBinding.ensureInitialized()..deferFirstFrame();

  await Firebase.initializeApp();

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
