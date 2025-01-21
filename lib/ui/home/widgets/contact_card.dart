import 'package:contacts_c13/core/colors/app_colors.dart';
import 'package:contacts_c13/models/contact.dart';
import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  Contact contact;
  int index;

  Function onClick;
  ContactCard({required this.contact, required this.index , required this.onClick, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.gold,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              child: Image.file(
                contact.image,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.email,
                      color: AppColors.dartBlue,
                    ),
                    const SizedBox(width: 8),
                    Expanded(child: Text(contact.email))
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(
                      Icons.phone,
                      color: AppColors.dartBlue,
                    ),
                    const SizedBox(width: 8),
                    Expanded(child: Text(contact.number))
                  ],
                ),
                const SizedBox(height: 8),
                FilledButton(
                    onPressed: () {
                      onClick(index);
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      )
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.delete,
                        ),
                        SizedBox(width: 8),
                        Text("Delete")
                      ],
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
