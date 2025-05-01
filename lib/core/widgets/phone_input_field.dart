import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneInputField extends StatelessWidget {
  final TextEditingController controller;
  final String? errorText;
  final bool enabled;
  final ValueChanged<String>? onChanged;

  const PhoneInputField({
    super.key,
    required this.controller,
    this.errorText,
    this.enabled = true,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      enabled: enabled,
      keyboardType: TextInputType.phone,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        _PhoneNumberFormatter(),
      ],
      onChanged: (value) {
        // Remove spaces for validation
        final cleanNumber = value.replaceAll(' ', '');
        if (onChanged != null) {
          onChanged!(cleanNumber);
        }
      },
      decoration: InputDecoration(
        labelText: 'Phone Number',
        hintText: '98765 43210',
        prefixText: '+91 ',
        errorText: errorText,
        border: const OutlineInputBorder(),
        filled: true,
        fillColor: Theme.of(context).colorScheme.surface,
      ),
    );
  }
}

class _PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) return newValue;

    final text = newValue.text.replaceAll(' ', '');
    if (text.length > 10) {
      return oldValue;
    }

    final formatted =
        text
            .replaceAllMapped(
              RegExp(r'(\d{5})(\d{0,5})'),
              (Match m) => '${m[1]} ${m[2]}',
            )
            .trim();

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
