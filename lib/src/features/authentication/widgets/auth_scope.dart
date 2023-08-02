import 'package:core/core.dart';
import 'package:flutter/widgets.dart';
import 'package:loans/src/features/app/widgets/app_scope.dart';
import 'package:loans/src/features/authentication/bloc/auth_bloc/auth_bloc.dart';

class AuthScope extends StatefulWidget {
  final Widget child;

  const AuthScope({required this.child, super.key});

  @override
  State<AuthScope> createState() => _AuthScopeState();

  static AuthBloc authBlocOf(BuildContext context, {bool listen = true}) {
    return _InheritedAuthScope.of(context, listen: listen).authBloc;
  }

  static void login(BuildContext context, User user) {
    return authBlocOf(context, listen: false).add(AuthEvent.login(user));
  }

  static void logout(BuildContext context) {
    return authBlocOf(context, listen: false).add(const AuthEvent.logout());
  }
}

class _AuthScopeState extends State<AuthScope> {
  AuthBloc? _authBloc;

  @override
  void didChangeDependencies() {
    _authBloc?.close();
    _authBloc = AuthBloc(initialUser: AppScope.authRepositoryOf(context).currentUser);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedAuthScope(
      authBloc: _authBloc!,
      child: widget.child,
    );
  }

  @override
  void dispose() {
    _authBloc?.close();
    super.dispose();
  }
}

class _InheritedAuthScope extends InheritedWidget {
  final AuthBloc authBloc;

  const _InheritedAuthScope({
    required this.authBloc,
    required super.child,
  });

  @override
  bool updateShouldNotify(covariant _InheritedAuthScope oldWidget) {
    if (oldWidget.authBloc != authBloc) return true;

    return false;
  }

  static _InheritedAuthScope of(BuildContext context, {bool listen = true}) {
    final widget = listen
        ? context.dependOnInheritedWidgetOfExactType<_InheritedAuthScope>()
        : context.getInheritedWidgetOfExactType<_InheritedAuthScope>();

    if (widget == null) throw Exception('No AuthScope found in provided context');

    return widget;
  }
}
