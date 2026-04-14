import 'package:credence_banking_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';

class WidgetTextField extends HookWidget {
  const WidgetTextField({
    super.key,
    this.controller,
    this.kType,
    this.inputFormatters,
    this.validator,
    this.maxLength,
    this.maxLines,
    this.labelText,
    this.hintText,
    this.prefixIcon,
    this.enabled,
    this.filled,
    this.obscureText,
    this.suffixIcon,
    this.fNode,
    this.prefixText,
    this.suffixIconTap,
    this.textCaps,
    this.onChanged,
    this.fillColor,
    this.isDense,
    this.errorText,
    this.autoValidate,
  });

  final TextEditingController? controller;
  final TextInputType? kType;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final int? maxLength;
  final int? maxLines;
  final String? labelText;
  final String? hintText;
  final String? prefixText;
  final IconData? prefixIcon;
  final bool? enabled;
  final bool? filled;
  final bool? obscureText;
  final IconData? suffixIcon;
  final FocusNode? fNode;
  final VoidCallback? suffixIconTap;
  final TextCapitalization? textCaps;
  final Function(String)? onChanged;
  final Color? fillColor;
  final bool? isDense;
  final String? errorText;
  final AutovalidateMode? autoValidate;

  @override
  Widget build(BuildContext context) {
    // Initialize the obscure state with the passed obscureText value (default to false)
    final isObscure = useState(obscureText ?? false);

    return TextFormField(
      controller: controller,
      autovalidateMode: autoValidate ?? AutovalidateMode.onUserInteraction,
      keyboardType: kType,
      validator: validator,
      maxLength: maxLength,
      maxLines: maxLines ?? 1,
      obscureText: isObscure.value,
      focusNode: fNode,
      onChanged: onChanged,
      inputFormatters: inputFormatters ?? [],
      textCapitalization: textCaps ?? TextCapitalization.none,
      style: TextStyle(
        fontFamily: 'Poppins',
        color: AppColors.charcoalBlack,
        fontSize: 12.sp,
      ),
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
        errorText: errorText,
        enabled: enabled ?? true,
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, color: AppColors.charcoalBlack)
            : null,
        labelText: labelText,
        labelStyle: const TextStyle(color: AppColors.charcoalBlack),
        prefixText: prefixText,
        counterText: '',
        hintText: hintText,
        hintStyle: TextStyle(color: AppColors.gray, fontSize: 12.sp),
        isDense: isDense ?? true,
        filled: filled ?? true,
        fillColor: fillColor ?? Theme.of(context).colorScheme.tertiary,
        suffixIcon: kType == TextInputType.visiblePassword
            ? IconButton(
                icon: Icon(
                  isObscure.value
                      ? Ionicons.eye_outline
                      : Ionicons.eye_off_outline,
                  color: AppColors.charcoalBlack,
                ),
                onPressed: () => isObscure.value = !isObscure.value,
              )
            : suffixIcon != null
            ? IconButton(
                icon: Icon(suffixIcon, color: AppColors.charcoalBlack),
                onPressed: suffixIconTap,
              )
            : null,
      ),
    );
  }
}
