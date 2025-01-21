import 'dart:io';

class Contact {
  File image;
  String name;
  String number;
  String email;

  Contact(this.image, this.name, this.number, this.email);

  static List<Contact> contacts = [];

}
