import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loans/src/features/app/router/router_config.dart';
import 'package:loans/src/features/authentication/bloc/phone_login_bloc/phone_login_bloc.dart';
import 'package:loans/src/features/authentication/widgets/auth_scope.dart';
import 'package:loans/src/features/authentication/widgets/phone_auth_scope.dart';
import 'package:loans/src/shared/assets/assets.dart';
import 'package:loans/src/shared/l10n/l10n.dart';
import 'package:ui_kit/ui_kit.dart';

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
      child: Builder(
        builder: (context) => MultiBlocListener(
          listeners: [
            BlocListener<PhoneLoginBloc, PhoneLoginState>(
              listener: (context, state) => state.mapOrNull(
                success: (state) => AuthScope.login(context, state.user),
                error: (state) => WarningDialog.show(
                  context,
                  title: context.locales.error_dialog_title,
                  message: context.locales.error_unknown,
                  icon: Icons.cancel,
                  cancel: (
                    caption: context.locales.close,
                    callback: () => context.router.pop(),
                  ),
                ),
              ),
            ),
          ],
          child: widget.child,
        ),
      ),
    );
  }
}
