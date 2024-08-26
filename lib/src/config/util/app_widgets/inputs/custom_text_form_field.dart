import 'package:e_commerce_admin/src/config/util/app_constants/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    required this.controller,
    this.labelText,
    this.labelStyle,
    this.hintText,
    this.hintStyle,
    this.counterText,
    this.prefix,
    this.prefixIcon,
    this.prefixText,
    this.suffix,
    this.suffixIcon,
    this.onChanged,
    this.validator,
    this.keyboardType,
    this.fillColor,
    this.enabledBorderColor,
    //this.border,
    this.autofocus,
    this.sizedBoxHeight,
    this.sizedBoxWidth,
    this.maxLines,
    this.enabled = true,
    Key? key,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? counterText;
  final String? labelText;
  final TextStyle? labelStyle;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? prefix;
  final Widget? prefixIcon;
  final String? prefixText;
  final Widget? suffix;
  final Widget? suffixIcon;
  final Color? fillColor;
  final Color? enabledBorderColor;
  //final InputBorder? border;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool? autofocus;
  final double? sizedBoxHeight;
  final double? sizedBoxWidth;
  final int? maxLines;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: sizedBoxHeight,
      width: sizedBoxWidth,
      child: TextFormField(
        enabled: enabled,
        //minLines: 10,
        maxLines: maxLines,
        controller: controller!,
        keyboardType: keyboardType,
        //style: AppTextStyles.mulishBlack16w600,
        //style: TextStyle(color: AppColors.white),
        style: const TextStyle(color: AppColors.black),
        decoration: InputDecoration(
          //focusColor: AppColors.red,
          labelText: labelText,
          labelStyle: labelStyle ?? const TextStyle(color: Colors.black26),
          //hintText: hintText!,
          //hintStyle: TextStyle(color: AppColors.black26),
          // hintStyle: AppTextStyles.mulishBlack14w600.copyWith(
          //   color: AppColors.black.withOpacity(0.5),
          // ),
          counterText: counterText,
          prefixText: prefixText,
          prefix: prefix,
          prefixIcon: prefixIcon,
          suffix: suffix,
          suffixIcon: suffixIcon,
          fillColor: fillColor ?? Colors.white,
          filled: true,
          // border: border ??
          //     OutlineInputBorder(
          //       borderSide: BorderSide(
          //         width: 0.0,
          //         style: BorderStyle.none,
          //       ),
          //     ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: enabledBorderColor ?? Colors.black26,
              width: 0.5,
              style: BorderStyle.solid,
            ),
          ),
          // border: OutlineInputBorder(
          //   borderSide: const BorderSide(
          //     color: Colors.red,
          //     width: 2.0,
          //     style: BorderStyle.solid,
          //   ),
          // ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 13, 116, 196),
              //color: Color.fromARGB(255, 20, 126, 24),
              width: 1.0,
              style: BorderStyle.solid,
            ),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.0,
              style: BorderStyle.solid,
            ),
          ),
          contentPadding: REdgeInsets.fromLTRB(20.0, 20.0, 10.0, 0.0),
          //contentPadding: REdgeInsets.symmetric(horizontal: 20, vertical: 10),
          // errorStyle: AppTextStyles.mulishMainColor16w600,
        ),
        validator: validator ??
            (value) {
              if (value == null || value.isEmpty) {
                return 'Поле не должно быть пустым!';
              }
              return null;
            },
        onChanged: onChanged,
        //autofocus: autofocus!,
      ),
    );
  }
}
