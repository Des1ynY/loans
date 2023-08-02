import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loans/src/features/app/router/router_config.dart';
import 'package:loans/src/features/authentication/bloc/phone_login_bloc/phone_login_bloc.dart';
import 'package:loans/src/features/authentication/bloc/send_verification_code_bloc/send_verification_code_bloc.dart';
import 'package:loans/src/features/authentication/widgets/auth_scope.dart';
import 'package:loans/src/features/authentication/widgets/phone_auth_scope.dart';
import 'package:loans/src/shared/assets/assets.dart';
import 'package:loans/src/shared/l10n/l10n.dart';
import 'package:ui_kit/ui_kit.dart';

class PhoneVerificationPageScope extends StatefulWidget {
  final String phone;
  final Widget child;

  const PhoneVerificationPageScope({
    required this.phone,
    required this.child,
    super.key,
  });

  @override
  State<PhoneVerificationPageScope> createState() => _PhoneVerificationPageScopeState();

  static String phoneOf(BuildContext context, {bool listen = true}) {
    return _InheritedPhoneVerificationPageScope.of(context, listen: listen).phone;
  }

  static SendVerificationCodeBloc sendVerificationCodeBlocOf(
    BuildContext context, {
    bool listen = true,
  }) {
    return PhoneAuthScope.sendVerificationCodeBlocOf(context, listen: listen);
  }

  static PhoneLoginBloc phoneLoginBlocOf(BuildContext context, {bool listen = true}) {
    return PhoneAuthScope.phoneLoginBlocOf(context, listen: listen);
  }

  static void sendVerificationCode(BuildContext context, String phone) {
    return PhoneAuthScope.sendVerificationCode(context, phone);
  }

  static void loginWithPhone(
    BuildContext context, {
    required String phone,
    required String verificationCode,
  }) {
    return PhoneAuthScope.loginWithPhone(
      context,
      phone: phone,
      verificationCode: verificationCode,
    );
  }
}

class _PhoneVerificationPageScopeState extends State<PhoneVerificationPageScope> {
  void _showWarningDialog() {
    WarningDialog.show(
      context,
      title: context.locales.error_dialog_title,
      message: context.locales.error_unknown,
      icon: Icons.cancel,
      cancel: (
        caption: context.locales.close,
        callback: () => context.router.pop(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PhoneAuthScope(
      child: Builder(
        builder: (context) => MultiBlocListener(
          listeners: [
            BlocListener<PhoneLoginBloc, PhoneLoginState>(
              bloc: PhoneAuthScope.phoneLoginBlocOf(context),
              listener: (context, state) => state.mapOrNull(
                success: (state) => AuthScope.login(context, state.user),
                error: (state) => _showWarningDialog(),
              ),
            ),
            BlocListener<SendVerificationCodeBloc, SendVerificationCodeState>(
              bloc: PhoneAuthScope.sendVerificationCodeBlocOf(context),
              listener: (context, state) => state.mapOrNull(
                error: (state) => _showWarningDialog(),
              ),
            ),
          ],
          child: _InheritedPhoneVerificationPageScope(
            phone: widget.phone,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}

class _InheritedPhoneVerificationPageScope extends InheritedWidget {
  final String phone;

  const _InheritedPhoneVerificationPageScope({
    required this.phone,
    required super.child,
  });

  @override
  bool updateShouldNotify(covariant _InheritedPhoneVerificationPageScope oldWidget) {
    if (oldWidget.phone != phone) return true;

    return false;
  }

  static _InheritedPhoneVerificationPageScope of(BuildContext context, {bool listen = true}) {
    final widget = listen
        ? context.dependOnInheritedWidgetOfExactType<_InheritedPhoneVerificationPageScope>()
        : context.getInheritedWidgetOfExactType<_InheritedPhoneVerificationPageScope>();

    if (widget == null) throw Exception('No PhoneVerificationPageScope found in provided context');

    return widget;
  }
}
