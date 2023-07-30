import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart' as concurrency;
import 'package:flutter/widgets.dart';
import 'package:loans/src/features/app/widgets/app.dart';

void main() {
  final binding = WidgetsFlutterBinding.ensureInitialized()..deferFirstFrame();

  Bloc.transformer = concurrency.sequential();

  binding.allowFirstFrame();
  runApp(const LoansApp());
}
