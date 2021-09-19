import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:ox_system_task/src/presentation/theme/styles.dart';

class BottomSheetLayout extends StatelessWidget {
  final EdgeInsets? padding;
  final Widget child;

  const BottomSheetLayout({
    required this.child,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Padding(
        padding:
        EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          color: Colors.transparent,
          child: Container(
            constraints: BoxConstraints(maxHeight: screenHeight * .9),
            padding: padding ?? EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.only(
                topLeft: AppStyles.radiusCircularBottom,
                topRight: AppStyles.radiusCircularBottom,
              ),
            ),
            child: SingleChildScrollView(
              controller: ModalScrollController.of(context),
              physics: BouncingScrollPhysics(),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
