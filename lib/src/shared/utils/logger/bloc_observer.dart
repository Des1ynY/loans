import 'package:bloc/bloc.dart';
import 'package:loans/src/shared/utils/logger/logger.dart';

class BlocLogger extends BlocObserver {
  const BlocLogger();

  @override
  void onCreate(BlocBase<Object?> bloc) {
    $Logger.info('${bloc.runtimeType} is created');
    super.onCreate(bloc);
  }

  @override
  void onTransition(Bloc<Object?, Object?> bloc, Transition<Object?, Object?> transition) {
    final event = transition.event.runtimeType;
    final currentState = transition.currentState.runtimeType;
    final nextState = transition.nextState.runtimeType;

    $Logger
      ..info('${bloc.runtimeType} has transition from $event:')
      ..info('$currentState -> $nextState');

    super.onTransition(bloc, transition);
  }

  @override
  void onError(BlocBase<Object?> bloc, Object error, StackTrace stackTrace) {
    $Logger.warning('${bloc.runtimeType} has error: $error', stackTrace: stackTrace);
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase<Object?> bloc) {
    $Logger.info('${bloc.runtimeType} is closed');
    super.onClose(bloc);
  }
}
