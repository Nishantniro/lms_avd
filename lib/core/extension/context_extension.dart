import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

extension ContextExtension on BuildContext {
  void showDialogBox() {
    showDialog( 
      context: this,
      builder: (BuildContext context) {
        return Center(
          child: Container(
            height: 60,
            width: 60, 
            color: Colors.transparent,

            child: LoadingAnimationWidget.inkDrop(
              color: Colors.yellow,
              size: 50,
            ),
          ),
        );
      },
    );
  }

  void pop() {
    Navigator.of(this).pop();
  }
}
