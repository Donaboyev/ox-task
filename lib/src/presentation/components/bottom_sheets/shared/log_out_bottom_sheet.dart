import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ox_system_task/src/presentation/components/bottom_sheets/bottom_sheet_layout.dart';
import 'package:ox_system_task/src/presentation/components/buttons/flat_button.dart';
import 'package:ox_system_task/src/presentation/theme/app_colors.dart';

class LogOut extends StatelessWidget {
  final Function() onTap;

  const LogOut({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomSheetLayout(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 30),
          const Center(
            child: Icon(
              Icons.error_rounded,
              color: AppColors.red,
              size: 50,
            ),
          ),
          const SizedBox(height: 30),
          Text(
            'log_out_your_account',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          AppFlatButton(
            color: AppColors.red,
            child: Text('yes_get_out'),
            onPressed: onTap,
          ),
          const SizedBox(height: 15),
          AppFlatButton(
            color: AppColors.grey6F,
            child: Text('cancellation'),
            onPressed: () => AutoRouter.of(context).pop(),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
