import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PhoneFormatter extends MaskTextInputFormatter {
  PhoneFormatter() : super(mask: _phoneMask, filter: {'#': RegExp('[0-9]')});

  static const _phoneMask = '### ### ####';

  static bool validateNumber(String phone) {
    if (phone.length != _phoneMask.length) return false;

    final digits = phone.replaceAll(' ', '');

    final regexp = RegExp(r'[^\d\s]');

    return !regexp.hasMatch(digits);
  }
}
