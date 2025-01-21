import 'package:contacts_c13/core/colors/app_colors.dart';
import 'package:flutter/material.dart';

typedef CustomTextFieldCallback = String? Function(String value);

class CustomTextField extends StatelessWidget {
  TextEditingController controller;
  String hint;

  CustomTextFieldCallback validator;
  TextInputType textInputType;

  CustomTextField({
    required this.controller,
    required this.hint,
    required this.validator,
    required this.textInputType,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: controller,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) => validator(value!),
          style: const TextStyle(
            fontSize: 16,
            color: AppColors.gold,
          ),
          keyboardType: textInputType,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: AppColors.gold,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: AppColors.gold,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: AppColors.gold,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: AppColors.gold,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: Colors.red,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: Colors.red,
              ),
            ),
            hintText: hint,
            hintStyle: const TextStyle(
              fontSize: 16,
              color: AppColors.lightBlue,
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
