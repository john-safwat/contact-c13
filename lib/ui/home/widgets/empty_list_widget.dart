import 'package:contacts_c13/core/assets/app_assets.dart';
import 'package:contacts_c13/core/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyListWidget extends StatelessWidget {
  const EmptyListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(AppAssets.emptyListAnimation),
          const Text(
            "There is No Contacts Added Here",
            style: TextStyle(
              color: AppColors.gold,
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
