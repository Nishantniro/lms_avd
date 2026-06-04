import 'package:flutter/material.dart';

class AppSnackBar {
  AppSnackBar._();

  static void success(BuildContext context, {required String message}) {
    _show(
      context,
      message: message,
      backgroundColor: Colors.green,
      icon: Icons.check_circle_outline,
    );
  }

  static void error(BuildContext context, {required String message}) {
    _show(
      context,
      message: message,
      backgroundColor: Colors.red,
      icon: Icons.error_outline,
    );
  }

  static void warning(BuildContext context, {required String message}) {
    _show(
      context,
      message: message,
      backgroundColor: Colors.orange,
      icon: Icons.warning_amber_outlined,
    );
  }

  static void info(BuildContext context, {required String message}) {
    _show(
      context,
      message: message,
      backgroundColor: Colors.blueGrey,
      icon: Icons.info_outline,
    );
  }

  static void _show(
    BuildContext context, {
    required String message,
    required Color backgroundColor,
    required IconData icon,
  }) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: backgroundColor,
          margin: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          content: Row(
            children: [
              Icon(icon, color: Colors.white),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  message,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }
}
