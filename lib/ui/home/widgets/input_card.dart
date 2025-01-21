import 'dart:io';

import 'package:contacts_c13/core/assets/app_assets.dart';
import 'package:contacts_c13/core/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class InputCard extends StatefulWidget {
  final TextEditingController nameController;

  final TextEditingController emailController;
  final TextEditingController phoneController;

  File? image;

  Function onClick;

  InputCard(
      {required this.nameController,
      required this.phoneController,
      required this.emailController,
      this.image,
        required this.onClick,
      super.key});

  @override
  State<InputCard> createState() => _InputCardState();
}

class _InputCardState extends State<InputCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          GestureDetector(
            onTap: ()async {
              await widget.onClick();
            },
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              child: AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(width: 2, color: AppColors.gold),
                  ),
                  child: widget.image == null
                      ? Lottie.asset(AppAssets.imagePickerAnimation)
                      : Image.file(widget.image! , fit: BoxFit.cover,),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ValueListenableBuilder(
                    valueListenable: widget.nameController,
                    builder: (context, value, child) => Text(
                      value.text.isEmpty ? "User Name" : value.text,
                      style: const TextStyle(fontSize: 20, color: AppColors.gold),
                    ),
                  ),
                  const Divider(color: AppColors.gold),
                  ValueListenableBuilder(
                    valueListenable: widget.emailController,
                    builder: (context, value, child) => Text(
                      value.text.isEmpty ? "Example@example.con" : value.text,
                      style: const TextStyle(fontSize: 20, color: AppColors.gold),
                    ),
                  ),
                  const Divider(color: AppColors.gold),
                  ValueListenableBuilder(
                    valueListenable: widget.phoneController,
                    builder: (context, value, child) => Text(
                      value.text.isEmpty ? "+200000000000" : value.text,
                      style: const TextStyle(fontSize: 20, color: AppColors.gold),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
