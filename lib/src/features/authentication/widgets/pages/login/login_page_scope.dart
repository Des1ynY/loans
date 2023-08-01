import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loans/src/features/app/router/router_config.dart';
import 'package:loans/src/features/authentication/bloc/send_verification_code_bloc/send_verification_code_bloc.dart';
import 'package:loans/src/features/authentication/widgets/phone_auth_scope.dart';

class LoginPageScope extends StatefulWidget {
  final Widget child;

  const LoginPageScope({required this.child, super.key});

  @override
  State<LoginPageScope> createState() => _LoginPageScopeState();

  static SendVerificationCodeBloc sendVerificationCodeBlocOf(
    BuildContext context, {
    bool listen = true,
  }) {
    return PhoneAuthScope.sendVerificationCodeBlocOf(context, listen: listen);
  }

  static void sendVerificationCode(BuildContext context, String phone) {
    return PhoneAuthScope.sendVerificationCode(context, phone);
  }
}

class _LoginPageScopeState extends State<LoginPageScope> {
  @override
  Widget build(BuildContext context) {
    return PhoneAuthScope(
      child: BlocListener<SendVerificationCodeBloc, SendVerificationCodeState>(
        bloc: PhoneAuthScope.sendVerificationCodeBlocOf(context),
        listener: (context, state) => state.mapOrNull(
          success: (state) => context.router.go(
            '/login/phone-verification',
            extra: {'phone': state.phone},
          ),
        ),
        child: widget.child,
      ),
    );
  }
}
