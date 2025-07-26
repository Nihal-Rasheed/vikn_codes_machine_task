import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class CommonDivider extends StatelessWidget {
  const CommonDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      height: 1,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            AppColors.scaffoldbgColor,
            // AppColors.primaryColor.withValues(alpha: 0.2),
            AppColors.primaryColor.withValues(alpha: 0.6),
            // AppColors.primaryColor.withValues(alpha: 0.2),
            AppColors.scaffoldbgColor,
          ],
        ),
      ),
    );
  }
}
