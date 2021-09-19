import 'package:flutter/material.dart';
import 'package:ox_system_task/src/presentation/components/buttons/app_icon_button.dart';
import 'package:ox_system_task/src/presentation/theme/app_colors.dart';
import 'package:ox_system_task/src/presentation/theme/styles.dart';

class HomeHeaderBar extends StatelessWidget {
  final IconData iconData;
  final Function()? onTap;

  const HomeHeaderBar({
    Key? key,
    this.onTap,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Продукты',
              style: AppStyles.styHomeTitle(),
            ),
          ),
          const SizedBox(width: 10),
          AppIconButton(
            size: 50,
            icon: Icon(
              iconData,
              color: AppColors.blue,
            ),
            onPressed: onTap,
          )
        ],
      ),
    );
  }
}
