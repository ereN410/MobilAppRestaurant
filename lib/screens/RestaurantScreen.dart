import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurant Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).go('/sutis');
              },
              child: Ink.image(
                image: AssetImage('assets/images/sutis_logo.png'),
                fit: BoxFit.cover, // Resmi butona sığacak şekilde boyutlandırır
                child: Container(
                  width: 200, // İstenilen genişlik değeri
                  height: 200, // İstenilen yükseklik değeri
                  child: Center(
                    child: Text('', style: TextStyle(fontSize: 24.0)),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).go('/beyazfirin');
              },
              child: Ink.image(
                image: AssetImage('assets/images/beyazfirin_logo.png'),
                fit: BoxFit.cover,
                child: Container(
                  width: 200,
                  height: 200,
                  child: Center(
                    child: Text('', style: TextStyle(fontSize: 24.0)),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).go('/bigchefs');
              },
              child: Ink.image(
                image: AssetImage('assets/images/bigchef_logo.png'),
                fit: BoxFit.cover,
                child: Container(
                  width: 200,
                  height: 200,
                  child: Center(
                    child: Text('', style: TextStyle(fontSize: 24.0)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
