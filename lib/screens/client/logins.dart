import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class Logins extends StatefulWidget {
  const Logins({Key? key}) : super(key: key);

  @override
  State<Logins> createState() => _LoginsState();
}

class _LoginsState extends State<Logins> {
  bool isDarkMode = false; // Initial dark mode state

  void toggleDarkMode() {
    setState(() {
      isDarkMode = !isDarkMode;
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
      backgroundColor: isDarkMode
          ? const Color.fromARGB(255, 32, 31, 31)
          : const Color.fromARGB(0, 247, 234, 234),
      appBar: AppBar(
        title: Text(
          "Login",
          style: TextStyle(
              color: isDarkMode
                  ? Colors.white
                  : const Color.fromARGB(255, 50, 50, 50)),
        ),
        titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        backgroundColor: isDarkMode
            ? const Color.fromARGB(255, 24, 23, 23)
            : const Color.fromARGB(
                255, 244, 242, 242), // Set background color explicitly
        actions: [
          IconButton(
            icon: Icon(
              isDarkMode
                  ? Icons.sunny
                  : Icons.nightlight, // Use sun icon for dark mode
              color: isDarkMode
                  ? Colors.white
                  : Colors.black, // Use white color for dark mode
            ),
            onPressed: toggleDarkMode,
          ),
        ],
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: isDarkMode
                ? const Color.fromARGB(255, 5, 5, 5)
                : Colors
                    .grey[200], // Adjust background color based on dark mode
          ),
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: isDarkMode
                              ? Colors.white
                              : const Color.fromARGB(255, 13, 13, 13),
                        ),
                      ),
                      labelText: 'Enter your mail..',
                      labelStyle: TextStyle(
                          color: isDarkMode ? Colors.white : Colors.black),
                    ),
                    style: TextStyle(
                        color: isDarkMode ? Colors.white : Colors.black),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: isDarkMode
                              ? Colors.white
                              : const Color.fromARGB(255, 6, 5, 5),
                        ),
                      ),
                      labelText: 'Enter your password..',
                      labelStyle: TextStyle(
                          color: isDarkMode ? Colors.white : Colors.black),
                    ),
                    style: TextStyle(
                        color: isDarkMode ? Colors.white : Colors.black),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isDarkMode
                            ? Colors.white
                            : const Color.fromARGB(255, 0, 5,
                                8), // Button background color based on dark mode
                      ),
                      onPressed: () async {
                        final SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        await prefs.setString('username', 'kullanici_adi');

                        GoRouter.of(context).go('/restaurant');
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: isDarkMode ? Colors.black : Colors.white),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
