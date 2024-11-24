import 'package:emoodie_music_app/core/resources/app_colors.dart';
import 'package:flutter/material.dart';
class CustomTextFormField extends StatelessWidget {
  final String? labelText;
  final String? initialValue, hintText;
  final Widget? icon;
  final Color iconColor;
  final bool? obscureText;

  final bool enabled, enableBorder;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final void Function(String?)? onSaved, onChanged;
  final String? Function(String?)? validator;
  final VoidCallback? iconPressed;
  final int? minLines;

  const CustomTextFormField(
      {super.key,
      this.labelText,
      this.icon,
      this.iconColor = AppColors.blackTextColor,
      this.obscureText = false,
      this.enableBorder = true,
      this.initialValue,
      this.enabled = true,
      this.hintText,
      this.iconPressed,
      this.keyboardType = TextInputType.text,
      this.controller,
      this.onSaved,
      this.onChanged,
      this.minLines,
      this.validator});

  @override
  Widget build(BuildContext context) {
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            height: 50,
            padding: const EdgeInsets.symmetric(vertical: 3),
            decoration: BoxDecoration(
              color: AppColors.whiteTextColor,
              borderRadius: BorderRadius.circular(
                8,
              ),
              border: Border.all(
                color: AppColors.blackTextColor,
                width: 1.5,
              ),
            ),
            child: icon != null
                ? Center(
                    child: TextFormField(
                      controller: controller,
                      onSaved: onSaved,
                      initialValue: initialValue,
                      validator: validator,
                      enabled: enabled,
                      keyboardType: keyboardType,
                      cursorColor: AppColors.blackTextColor,
                      minLines: minLines,
                      maxLines: 1,
                      obscureText: obscureText!,
                      onChanged: onChanged,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: InputDecoration(
                        prefixIcon: IconButton(
                          icon: icon!,
                          key: const Key("prefixIcon"),
                          onPressed: iconPressed,
                          color: iconColor,
                          padding: const EdgeInsets.only(right: 0),
                        ),
                        border: InputBorder.none,
                        hintText: hintText,
                        labelText: labelText,
                        labelStyle: const TextStyle(
                          color: AppColors.blackTextColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        hintStyle: TextStyle(
                          color: AppColors.primaryColorSwatch.shade300.withOpacity(0.5),
                          fontSize: 14,
                        ),
                        errorText: null,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                      ),
                    ),
                  )
                : Center(
                    child: TextFormField(
                      controller: controller,
                      onSaved: onSaved,
                      initialValue: initialValue,
                      validator: validator,
                      enabled: enabled,
                      keyboardType: keyboardType,
                      cursorColor: AppColors.blackTextColor,
                      minLines: minLines,
                      maxLines: 1,
                      obscureText: obscureText!,
                      onChanged: onChanged,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: hintText,
                        labelText: labelText,
                        labelStyle: const TextStyle(
                          color: AppColors.blackTextColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        hintStyle: TextStyle(
                          color: AppColors.primaryColorSwatch.shade400,
                        ),
                        isDense: true, 
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical:
                              -5,
                        ),
                        errorText: null,
                      ),
                    ),
                  ))
      ],
    );
  }
}
