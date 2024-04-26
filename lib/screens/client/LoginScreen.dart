import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isDarkMode = false; // Başlangıçta dark mode kapalı olarak ayarlandı

  void toggleDarkMode() {
    setState(() {
      isDarkMode = !isDarkMode; // Dark mode durumunu tersine çevir
      if (isDarkMode) {
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
      } else {
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkMode ? Color.fromARGB(255, 2, 2, 2) : Colors.white,
      appBar: AppBar(
        title: Text(
          "Welcome To RESTARANTUS",
          style: TextStyle(
              color: isDarkMode
                  ? Colors.white
                  : Colors.black), // Başlık rengini dark moda göre ayarla
        ),
        backgroundColor:
            isDarkMode ? Color.fromARGB(255, 12, 12, 12) : Colors.white,
        actions: [
          IconButton(
            onPressed: toggleDarkMode, // Toggle function for dark mode
            icon: Icon(
              isDarkMode
                  ? Icons.sunny
                  : Icons.nightlight, // Icon changes based on dark mode state
              color: isDarkMode
                  ? Colors.white
                  : const Color.fromARGB(255, 45, 45, 45),
            ),
          ),
        ],
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/logos.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Your existing content goes here
              SizedBox(
                height: 200,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    onPressed: () => context.push("/logins"),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: isDarkMode ? Colors.white : Colors.black,
                      backgroundColor: isDarkMode
                          ? Color.fromARGB(255, 5, 5, 5)
                          : Colors.white,
                    ),
                    child: const Text("login"),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    onPressed: () => context.push("/register"),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: isDarkMode ? Colors.white : Colors.black,
                      backgroundColor: isDarkMode ? Colors.black : Colors.white,
                    ),
                    child: const Text("register"),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  OutlinedButton(
                    onPressed: () => context.push("/restaurant"),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: isDarkMode ? Colors.white : Colors.black,
                      backgroundColor: isDarkMode ? Colors.black : Colors.white,
                    ),
                    child: const Text("home"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
