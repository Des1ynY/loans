import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loans/src/features/app/router/router_config.dart';
import 'package:loans/src/features/authentication/bloc/auth_bloc.dart';
import 'package:loans/src/features/authentication/widgets/auth_scope.dart';

class NavigationAuthGuard extends StatelessWidget {
  final Widget child;

  const NavigationAuthGuard({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      bloc: AuthScope.authBlocOf(context),
      listener: (context, state) => state.mapOrNull(
        unauthenticated: (state) => context.router.go('/login'),
      ),
      child: child,
    );
  }
}
