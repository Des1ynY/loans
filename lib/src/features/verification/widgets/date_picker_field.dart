import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loans/src/shared/l10n/l10n.dart';
import 'package:ui_kit/ui_kit.dart';

// TODO: refactor implementation
class DatePickerField extends StatefulWidget {
  const DatePickerField({super.key});

  @override
  State<DatePickerField> createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<DatePickerField> {
  final _fieldController = TextEditingController();

  String get _hintText {
    final formattedDate = DateFormat.yMd().format(DateTime.now());

    return formattedDate.replaceAll(RegExp('[0-9]'), '-');
  }

  Future<void> _selectDate() async {
    final startDate = DateTime.now();

    final date = await showDatePicker(
      context: context,
      firstDate: DateTime(1900),
      lastDate: startDate,
      initialDate: startDate,
      initialDatePickerMode: DatePickerMode.year,
    );

    if (mounted && date != null) _fieldController.text = DateFormat.yMd().format(date);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _selectDate,
      child: AbsorbPointer(
        child: TextInputField.labeled(
          controller: _fieldController,
          label: context.locales.user_verification_birth_date,
          hintText: _hintText,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _fieldController.dispose();
    super.dispose();
  }
}
