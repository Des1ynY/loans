import 'src/code_input_field_base.dart';

class CodeInputField extends CodeInputFieldBase {
  const CodeInputField({
    required super.codeLength,
    super.onSubmitted,
    super.key,
  });
}
