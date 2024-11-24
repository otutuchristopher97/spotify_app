import 'package:emoodie_music_app/core/resources/app_colors.dart';
import 'package:flutter/material.dart';

class CustomText extends StatefulWidget {
  const CustomText({
    super.key,
    this.maxLines,
    this.overflow,
    this.fontSize,
    this.color,
    this.fontWeight,
    this.text, this.textAlign,
  });

  final String? text;
  final int? maxLines;
  final TextOverflow? overflow;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;

  @override
  State<CustomText> createState() => _CustomTextState();
}

class _CustomTextState extends State<CustomText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text!,
      maxLines: widget.maxLines,
      overflow: widget.overflow,
      textAlign: widget.textAlign ??  TextAlign.start,
      style: TextStyle(
        fontSize: widget.fontSize ?? 12,
        color: widget.color ?? AppColors.whiteTextColor,
        fontWeight: widget.fontWeight ?? FontWeight.normal,
        
      ),
    );
  }
}
