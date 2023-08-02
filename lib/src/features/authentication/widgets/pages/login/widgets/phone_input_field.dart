import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:loans/src/features/authentication/widgets/pages/login/utils/phone_formatter.dart';
import 'package:ui_kit/ui_kit.dart';

class PhoneInputField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputCallback<void>? onSubmitted;

  const PhoneInputField({
    required this.controller,
    this.onSubmitted,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '+7',
          style: context.bodyStyles.xl.copyWith(color: context.textColors.primary),
        ),
        const SizedBox(width: kSpacingM),
        Expanded(
          child: TextInputField(
            controller: controller,
            hintText: '000 000 0000',
            autofocus: true,
            keyboardType: TextInputType.phone,
            inputAction: TextInputAction.send,
            onSubmitted: onSubmitted,
            formatters: [
              PhoneFormatter(),
              // FilteringTextInputFormatter.allow(r'\d'),
            ],
          ),
        ),
      ],
    );
  }
}
