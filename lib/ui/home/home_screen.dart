import 'dart:io';

import 'package:contacts_c13/core/assets/app_assets.dart';
import 'package:contacts_c13/core/colors/app_colors.dart';
import 'package:contacts_c13/models/contact.dart';
import 'package:contacts_c13/ui/home/widgets/bottom_sheet_widget.dart';
import 'package:contacts_c13/ui/home/widgets/contact_card.dart';
import 'package:contacts_c13/ui/home/widgets/custom_text_field.dart';
import 'package:contacts_c13/ui/home/widgets/empty_list_widget.dart';
import 'package:contacts_c13/ui/home/widgets/input_card.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dartBlue,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                AppAssets.logo,
                height: MediaQuery.of(context).size.height * 0.05,
              ),
            ),
            Contact.contacts.isEmpty
                ? const EmptyListWidget()
                : Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.all(16),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        childAspectRatio: 0.7,
                      ),
                      itemBuilder: (context, index) => ContactCard(
                        onClick: (int index){
                          Contact.contacts.removeAt(index);
                          setState(() {

                          });
                        },
                          contact: Contact.contacts[index], index: index),
                      itemCount: Contact.contacts.length,
                    ),
                  ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Visibility(
            visible: Contact.contacts.isNotEmpty,
            child: FloatingActionButton(
              onPressed: () {
                Contact.contacts.removeAt(Contact.contacts.length - 1);
                setState(() {});
              },
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              child: const Icon(Icons.delete),
            ),
          ),
          const SizedBox(height: 16),
          Visibility(
            visible: Contact.contacts.length < 4,
            child: FloatingActionButton(
              onPressed: () {
                _showModalButtonSheet();
              },
              backgroundColor: AppColors.gold,
              foregroundColor: AppColors.dartBlue,
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }

  void _showModalButtonSheet() async {
    await showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.dartBlue,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(40),
        topRight: Radius.circular(40),
      )),
      isScrollControlled: true,
      builder: (context) => BottomSheetWidget(),
    );
    setState(() {});
  }
}
