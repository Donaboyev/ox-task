import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

Future<T?> showSheet<T>(BuildContext context,
    {required Widget child, bool isDismissible = true}) =>
    showMaterialModalBottomSheet(
      isDismissible: isDismissible,
      enableDrag: isDismissible,
      context: context,
      builder: (context) => child,
    );
