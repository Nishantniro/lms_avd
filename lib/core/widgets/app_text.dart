import 'package:flutter/material.dart';

enum AppTextType { heading, title, body, label, caption }

class AppText extends StatelessWidget {
  final String text;
  final AppTextType type;

  final Color? color;
  final FontWeight? fontWeight;

  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const AppText(
    this.text, {
    super.key,
    this.type = AppTextType.body,
    this.color,
    this.fontWeight,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  TextStyle _style(BuildContext context) {
    switch (type) {
      case AppTextType.heading:
        return Theme.of(context).textTheme.headlineMedium!.copyWith(
          fontSize: 32,
          fontWeight: fontWeight ?? FontWeight.bold,
          color: color,
        );

      case AppTextType.title:
        return Theme.of(context).textTheme.titleLarge!.copyWith(
          fontWeight: fontWeight ?? FontWeight.w700,
          color: color,
        );

      case AppTextType.label:
        return Theme.of(context).textTheme.labelLarge!.copyWith(
          fontWeight: fontWeight ?? FontWeight.w600,
          color: color,
        );

      case AppTextType.caption:
        return Theme.of(
          context,
        ).textTheme.bodySmall!.copyWith(color: color ?? Colors.grey);

      case AppTextType.body:
        return Theme.of(context).textTheme.bodyMedium!.copyWith(color: color);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: _style(context),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
