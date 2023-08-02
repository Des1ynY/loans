import 'package:flutter/widgets.dart';
import 'package:loans/src/features/app/widgets/app_scope.dart';
import 'package:loans/src/features/authentication/bloc/phone_login_bloc/phone_login_bloc.dart';
import 'package:loans/src/features/authentication/bloc/send_verification_code_bloc/send_verification_code_bloc.dart';

class PhoneAuthScope extends StatefulWidget {
  final Widget child;

  const PhoneAuthScope({required this.child, super.key});

  @override
  State<PhoneAuthScope> createState() => _PhoneAuthScopeState();

  static SendVerificationCodeBloc sendVerificationCodeBlocOf(
    BuildContext context, {
    bool listen = true,
  }) {
    return _InheritedPhoneAuthScope.of(
      context,
      listen: listen,
      dependency: _PhoneAuthDependencies.sendVerificationCodeBloc,
    ).sendVerificationCodeBloc;
  }

  static PhoneLoginBloc phoneLoginBlocOf(BuildContext context, {bool listen = true}) {
    return _InheritedPhoneAuthScope.of(
      context,
      listen: listen,
      dependency: _PhoneAuthDependencies.phoneLoginBloc,
    ).phoneLoginBloc;
  }

  static void sendVerificationCode(BuildContext context, String phone) {
    return sendVerificationCodeBlocOf(context, listen: false).add(
      SendVerificationCodeEvent.sendCode(phone),
    );
  }

  static void loginWithPhone(
    BuildContext context, {
    required String phone,
    required String verificationCode,
  }) {
    return phoneLoginBlocOf(context, listen: false).add(
      PhoneLoginEvent.login(phone, verificationCode),
    );
  }
}

class _PhoneAuthScopeState extends State<PhoneAuthScope> {
  SendVerificationCodeBloc? _sendVerificationCodeBloc;
  PhoneLoginBloc? _phoneLoginBloc;

  @override
  void didChangeDependencies() {
    _sendVerificationCodeBloc?.close();
    _phoneLoginBloc?.close();

    final authRepository = AppScope.authRepositoryOf(context);
    _sendVerificationCodeBloc = SendVerificationCodeBloc(repository: authRepository);
    _phoneLoginBloc = PhoneLoginBloc(repository: authRepository);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedPhoneAuthScope(
      sendVerificationCodeBloc: _sendVerificationCodeBloc!,
      phoneLoginBloc: _phoneLoginBloc!,
      child: widget.child,
    );
  }

  @override
  void dispose() {
    _sendVerificationCodeBloc?.close();
    _phoneLoginBloc?.close();
    super.dispose();
  }
}

enum _PhoneAuthDependencies { sendVerificationCodeBloc, phoneLoginBloc }

class _InheritedPhoneAuthScope extends InheritedModel<_PhoneAuthDependencies> {
  final SendVerificationCodeBloc sendVerificationCodeBloc;
  final PhoneLoginBloc phoneLoginBloc;

  const _InheritedPhoneAuthScope({
    required this.sendVerificationCodeBloc,
    required this.phoneLoginBloc,
    required super.child,
  });

  @override
  bool updateShouldNotify(covariant _InheritedPhoneAuthScope oldWidget) {
    if (oldWidget.sendVerificationCodeBloc != sendVerificationCodeBloc) return true;
    if (oldWidget.phoneLoginBloc != phoneLoginBloc) return true;

    return false;
  }

  @override
  bool updateShouldNotifyDependent(
    covariant _InheritedPhoneAuthScope oldWidget,
    Set<_PhoneAuthDependencies> dependencies,
  ) {
    for (final dependency in dependencies) {
      switch (dependency) {
        case _PhoneAuthDependencies.sendVerificationCodeBloc:
          if (oldWidget.sendVerificationCodeBloc != sendVerificationCodeBloc) return true;
        case _PhoneAuthDependencies.phoneLoginBloc:
          if (oldWidget.phoneLoginBloc != phoneLoginBloc) return true;
      }
    }

    return false;
  }

  static _InheritedPhoneAuthScope of(
    BuildContext context, {
    bool listen = true,
    _PhoneAuthDependencies? dependency,
  }) {
    final widget = listen
        ? InheritedModel.inheritFrom<_InheritedPhoneAuthScope>(context, aspect: dependency)
        : context.getInheritedWidgetOfExactType<_InheritedPhoneAuthScope>();

    if (widget == null) throw Exception('No PhoneAuthScope found in provided context');

    return widget;
  }
}
