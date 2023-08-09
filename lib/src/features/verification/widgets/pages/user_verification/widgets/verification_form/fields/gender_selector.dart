part of '../user_verification_form.dart';

class _GenderSelector extends StatefulWidget {
  const _GenderSelector();

  @override
  State<_GenderSelector> createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<_GenderSelector> {
  bool? _isMale;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.locales.user_verification_gender,
          style: context.bodyStyles.m.copyWith(color: context.textColors.tertiary),
        ),
        const SizedBox(height: kSpacingS),
        FittedBox(
          child: Row(
            children: [
              CheckBox(
                isSelected: _isMale ?? false,
                onChanged: (_) => setState(() => _isMale = true),
                child: Text(
                  context.locales.user_verification_gender_male,
                  style: context.bodyStyles.m.copyWith(color: context.textColors.tertiary),
                ),
              ),
              const SizedBox(width: kSpacingL),
              CheckBox(
                isSelected: _isMale == false,
                onChanged: (_) => setState(() => _isMale = false),
                child: Text(
                  context.locales.user_verification_gender_female,
                  style: context.bodyStyles.m.copyWith(color: context.textColors.tertiary),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
