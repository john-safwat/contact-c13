import 'dart:io';

import 'package:contacts_c13/core/colors/app_colors.dart';
import 'package:contacts_c13/models/contact.dart';
import 'package:contacts_c13/ui/home/widgets/custom_text_field.dart';
import 'package:contacts_c13/ui/home/widgets/input_card.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class BottomSheetWidget extends StatefulWidget {
  BottomSheetWidget({super.key});

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final phoneController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  File? image;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: MediaQuery.of(context).viewInsets,
        child: Wrap(
          children: [
            InputCard(
              nameController: nameController,
              phoneController: phoneController,
              emailController: emailController,
              image: image,
              onClick: () async {
                ImagePicker imagePicker = ImagePicker();
                var file =
                    await imagePicker.pickImage(source: ImageSource.gallery);
                if (file != null) {
                  image = File(file.path);
                  setState(() {});
                }
              },
            ),
            CustomTextField(
              controller: nameController,
              hint: "Enter Your Name",
              textInputType: TextInputType.name,
              validator: (value) => value.isEmpty ? "Enter Your Name" : null,
            ),
            CustomTextField(
              controller: emailController,
              hint: "Enter Your Email",
              textInputType: TextInputType.emailAddress,
              validator: (value) {
                if (value.isEmpty) {
                  return "Enter Your Email";
                } else if (!RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+"
                        r"@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                        r"{0,253}[a-zA-Z0-9])?)*$")
                    .hasMatch(value)) {
                  return "Enter Valid Email";
                }
                return null;
              },
            ),
            CustomTextField(
              controller: phoneController,
              textInputType: TextInputType.phone,
              hint: "Enter Your Phone",
              validator: (value) {
                if (value.isEmpty) {
                  return "Enter Your Phone";
                } else if (!RegExp(r'^01[0125][0-9]{8}$').hasMatch(value)) {
                  return "Enter Valid Phone";
                }
                return null;
              },
            ),
            FilledButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    if (image == null) {
                      return;
                    }
                    Contact.contacts.add(Contact(image!, nameController.text,
                        phoneController.text, emailController.text));
                    Navigator.pop(context);
                  }
                },
                style: FilledButton.styleFrom(
                    backgroundColor: AppColors.gold,
                    foregroundColor: AppColors.dartBlue,
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16))),
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Enter User"),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
