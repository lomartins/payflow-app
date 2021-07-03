import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/themes/appcolors.dart';

class InputTextWidget extends StatelessWidget {
  final String label;
  final IconData icon;
  final String? initialValue;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  const InputTextWidget({
    Key? key,
    required this.label,
    required this.icon,
    required this.onChanged,
    this.initialValue,
    this.validator,
    this.controller,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  final void Function(String value) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        children: [
          TextFormField(
            initialValue: initialValue,
            controller: controller,
            validator: validator,
            onChanged: onChanged,
            keyboardType: keyboardType,
            style: AppTextStyles.input,
            decoration: InputDecoration(
                labelText: label,
                labelStyle: AppTextStyles.input,
                icon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Icon(
                        icon,
                        color: AppColors.primary,
                      ),
                    ),
                    Container(
                      width: 1,
                      height: 48,
                      color: AppColors.stroke,
                    )
                  ],
                ),
                border: InputBorder.none),
          ),
          Divider(
            height: 1,
            thickness: 1,
            color: AppColors.stroke,
          ),
        ],
      ),
    );
  }
}
