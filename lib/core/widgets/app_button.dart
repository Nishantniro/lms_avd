import 'package:flutter/material.dart';

enum ButtonType {
  filled,
  outlined,
  text,
}

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final ButtonType type;

  final bool isLoading;
  final bool fullWidth;

  final IconData? icon;

  final Color? backgroundColor;
  final Color? foregroundColor;

  final double height;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.type = ButtonType.filled,
    this.isLoading = false,
    this.fullWidth = true,
    this.icon,
    this.backgroundColor,
    this.foregroundColor,
    this.height = 52,
    this.borderRadius = 14,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final child = isLoading
        ? const SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                Icon(icon, size: 20),
                const SizedBox(width: 8),
              ],
              Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          );

    Widget button;

    switch (type) {
      case ButtonType.outlined:
        button = OutlinedButton(
          onPressed: isLoading ? null : onPressed,
          style: OutlinedButton.styleFrom(
            minimumSize: Size(double.infinity, height),
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(borderRadius),
            ),
            padding: padding,
          ),
          child: child,
        );
        break;

      case ButtonType.text:
        button = TextButton(
          onPressed: isLoading ? null : onPressed,
          style: TextButton.styleFrom(
            minimumSize: Size(double.infinity, height),
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(borderRadius),
            ),
            padding: padding,
          ),
          child: child,
        );
        break;

      default:
        button = FilledButton(
          onPressed: isLoading ? null : onPressed,
          style: FilledButton.styleFrom(
            backgroundColor: backgroundColor,
            foregroundColor: foregroundColor,
            minimumSize: Size(double.infinity, height),
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(borderRadius),
            ),
            padding: padding,
          ),
          child: child,
        );
    }

    return fullWidth
        ? SizedBox(width: double.infinity, child: button)
        : button;
  }
}