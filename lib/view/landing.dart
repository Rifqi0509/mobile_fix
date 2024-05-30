import 'package:flutter/material.dart';
import 'package:pantau_pro/register/Home_page.dart';
import 'package:pantau_pro/register/login.dart';
import 'package:pantau_pro/view/logintutorial.dart';
import 'package:pantau_pro/view/registertutorial.dart';
// Import your tutorial pages
// import 'path_to_your_tutorial_login_page.dart';
// import 'path_to_your_tutorial_register_page.dart';

void main() {
  runApp(LandingPageApp());
}

class LandingPageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Landing Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        popupMenuTheme: PopupMenuThemeData(
          color: Colors.white,
          textStyle: TextStyle(color: Colors.black),
        ),
      ),
      home: LandingPage(),
    );
  }
}

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('Asset/image/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Overlay with gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.5),
                  Colors.black.withOpacity(0.3)
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          // Help icon with text as button with dropdown
          Positioned(
            top: 40,
            right: 20,
            child: PopupMenuButton<String>(
              onSelected: (value) {
                if (value == 'tutorial_login') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          PageViewApp(), // Replace with your tutorial login page
                    ),
                  );
                } else if (value == 'tutorial_register') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          RegisterAPP(), // Replace with your tutorial register page
                    ),
                  );
                }
              },
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    value: 'tutorial_login',
                    child: Row(
                      children: [
                        Icon(Icons.login, color: Colors.black),
                        SizedBox(width: 8),
                        Text('Tutorial Login'),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'tutorial_register',
                    child: Row(
                      children: [
                        Icon(Icons.app_registration, color: Colors.black),
                        SizedBox(width: 8),
                        Text('Tutorial Register'),
                      ],
                    ),
                  ),
                ];
              },
              child: Row(
                children: [
                  Icon(Icons.support_agent, color: Colors.white),
                  SizedBox(width: 8),
                  Text(
                    'Bantuan',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Pantau Tamu Pro',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Opacity(
                    opacity: 0.7,
                    child: Text(
                      'Jadikan setiap kunjungan tak terlupakan.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  SizedBox(height: 100),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to another screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginApp(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      textStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(9.0), // Border radius here
                      ),
                    ),
                    child: Text('Mulai'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
