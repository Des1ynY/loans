// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/widgets.dart';
import 'package:loans/src/features/authentication/data/auth_repository.dart';

enum _AppDependencies { authRepository }

class AppScope extends InheritedModel<_AppDependencies> {
  final AuthRepository authRepository;

  const AppScope({
    required this.authRepository,
    required super.child,
    super.key,
  });

  @override
  bool updateShouldNotify(covariant AppScope oldWidget) {
    if (oldWidget.authRepository != authRepository) return true;

    return false;
  }

  @override
  bool updateShouldNotifyDependent(
    covariant AppScope oldWidget,
    Set<_AppDependencies> dependencies,
  ) {
    for (final dependency in dependencies) {
      switch (dependency) {
        case _AppDependencies.authRepository:
          if (oldWidget.authRepository != authRepository) return true;
      }
    }

    return false;
  }

  static AuthRepository authRepositoryOf(BuildContext context, {bool listen = true}) {
    final widget = listen
        ? InheritedModel.inheritFrom<AppScope>(context, aspect: _AppDependencies.authRepository)
        : context.getInheritedWidgetOfExactType<AppScope>();

    if (widget == null) throw Exception('No AppScope found in provided context');

    return widget.authRepository;
  }
}
