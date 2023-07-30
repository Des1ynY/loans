import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart' as concurrency;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:loans/src/features/app/widgets/app.dart';

Future<void> main() async {
  final binding = WidgetsFlutterBinding.ensureInitialized()..deferFirstFrame();

  await Firebase.initializeApp();

  Bloc.transformer = concurrency.sequential();

  binding.allowFirstFrame();
  runApp(const LoansApp());
}
