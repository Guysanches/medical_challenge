import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medical_challenge/pages/doctor_form/stores/doctor_form_store.dart';
import 'dart:math' as math;

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final FocusNode currentNode;
  final FocusNode nextNode;
  final int maxLength;
  final bool onlyNumber;
  final Function(String value) onChanged;
  final String errorText;
  final StateForm state;
  final bool phone;
  final bool decimal;

  CustomTextField({
    Key? key,
    required this.controller,
    required this.label,
    required this.currentNode,
    required this.nextNode,
    required this.maxLength,
    this.onlyNumber = false,
    required this.onChanged,
    required this.errorText,
    required this.state,
    this.phone = false,
    this.decimal = false,
  }) : super(key: key);

  dynamic onError() {
    if ((state == StateForm.error) && (errorText != ''))
      return errorText;
    else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: TextStyle(fontSize: 12),
      focusNode: currentNode,
      maxLength: maxLength != 0 ? maxLength : null,
      keyboardType: onlyNumber
          ? TextInputType.numberWithOptions(decimal: true)
          : TextInputType.name,
      inputFormatters:
          decimal ? [DecimalTextInputFormatter(decimalRange: 2)] : null,
      onChanged: (value) => onChanged(value),
      decoration: InputDecoration(
        labelText: label,
        hintText: label,
        errorText: onError(),
        border: OutlineInputBorder(
          borderSide: BorderSide(),
        ),
      ),
    );
  }
}

class DecimalTextInputFormatter extends TextInputFormatter {
  DecimalTextInputFormatter({required this.decimalRange})
      : assert(decimalRange > 0);

  final int decimalRange;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue, // unused.
    TextEditingValue newValue,
  ) {
    TextSelection newSelection = newValue.selection;
    String truncated = newValue.text;

    String value = newValue.text;

    if (value.contains(".") &&
        value.substring(value.indexOf(".") + 1).length > decimalRange) {
      truncated = oldValue.text;
      newSelection = oldValue.selection;
    } else if (value == ".") {
      truncated = "0.";

      newSelection = newValue.selection.copyWith(
        baseOffset: math.min(truncated.length, truncated.length + 1),
        extentOffset: math.min(truncated.length, truncated.length + 1),
      );
    }

    return TextEditingValue(
      text: truncated,
      selection: newSelection,
      composing: TextRange.empty,
    );
  }
}
