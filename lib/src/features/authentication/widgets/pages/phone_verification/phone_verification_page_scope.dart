import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loans/src/features/authentication/bloc/phone_login_bloc/phone_login_bloc.dart';
import 'package:loans/src/features/authentication/widgets/auth_scope.dart';
import 'package:loans/src/features/authentication/widgets/phone_auth_scope.dart';

class PhoneVerificationPageScope extends StatefulWidget {
  final Widget child;

  const PhoneVerificationPageScope({required this.child, super.key});

  @override
  State<PhoneVerificationPageScope> createState() => _PhoneVerificationPageScopeState();
}

class _PhoneVerificationPageScopeState extends State<PhoneVerificationPageScope> {
  @override
  Widget build(BuildContext context) {
    return PhoneAuthScope(
      child: MultiBlocListener(
        listeners: [
          BlocListener<PhoneLoginBloc, PhoneLoginState>(
            listener: (context, state) => state.mapOrNull(
              success: (state) => AuthScope.login(context, state.user),
            ),
          ),
        ],
        child: widget.child,
      ),
    );
  }
}
