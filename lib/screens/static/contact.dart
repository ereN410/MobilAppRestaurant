import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Contact {
  final String name;
  final String phone;
  final String email;
  final String address;

  Contact({
    required this.name,
    required this.phone,
    required this.email,
    required this.address,
  });
}

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  List<Contact> contacts = [
    Contact(
      name: 'John Doe',
      phone: '(123) 456-7890',
      email: 'johndoe@example.com',
      address: '123 Main St, Anytown, CA 12345',
    ),
    Contact(
      name: 'Jane Smith',
      phone: '(987) 654-3210',
      email: 'janesmith@example.com',
      address: '456 Elm St, Anytown, CA 12345',
    ),
  ];

  bool _isDarkMode = false;

  void toggleDarkMode() {
    setState(() {
      _isDarkMode = !_isDarkMode;
      if (_isDarkMode) {
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
      } else {
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _isDarkMode ? Colors.black : Colors.white,
      appBar: AppBar(
        title: Text('Kişiler'),
        actions: [
          IconButton(
            onPressed: toggleDarkMode,
            icon: Icon(
              _isDarkMode ? Icons.sunny : Icons.nightlight,
              color: _isDarkMode ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          Contact contact = contacts[index];
          return ListTile(
            title: Text(contact.name, style: TextStyle(color: _isDarkMode ? Colors.white : Colors.black)),
            subtitle: Text(
              '${contact.phone}\n${contact.email}',
              style: TextStyle(color: _isDarkMode ? Colors.white70 : Colors.black54),
            ),
          );
        },
      ),
    );
  }
}
