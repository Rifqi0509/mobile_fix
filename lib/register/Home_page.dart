import 'package:flutter/material.dart';
import 'package:pantau_pro/dashboard/notifikasi.dart';
import 'package:pantau_pro/dashboard/profil.dart';
import 'package:pantau_pro/dashboard/survey.dart';
import 'package:pantau_pro/view/landing.dart';
import 'package:pantau_pro/dashboard/kunjungan.dart';
import 'package:pantau_pro/dashboard/feedback.dart';
import 'package:pantau_pro/dashboard/riwayat.dart';
import 'package:badges/badges.dart';

class HomePage extends StatelessWidget {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding:
                const EdgeInsets.fromLTRB(40, 30, 40, 0), // Adjust as needed
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                      color: const Color.fromARGB(
                          255, 255, 255, 255)!), // Border color
                ),
              ),
              onChanged: (value) {
                // Add function to update search results here
              },
            ),
          ),
          SizedBox(height: 20),
          Card(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'Asset/image/background.jpg'), // Change with your image path
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(50),
                child: Text(
                  'Selamat datang di Pantau Tamu Pro!',
                  style: TextStyle(
                      fontSize: 24, color: Colors.white, fontFamily: 'Man'),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              padding: EdgeInsets.all(10),
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => KunjunganPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: CardWithIcon(
                    imagePath: 'Asset/image/dbform.png',
                    text: 'Buat Kunjungan',
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SurveyApp()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: CardWithIcon(
                    imagePath: 'Asset/image/survey.png',
                    text: 'Survey Kepuasan',
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FeedbackPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: CardWithIcon(
                    imagePath: 'Asset/image/feedback.png',
                    text: 'Feedback',
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => riwayatapp()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: CardWithIcon(
                    imagePath: 'Asset/image/riwayat.png',
                    text: 'Riwayat Pengajuan',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          // Handle bottom navigation item taps
          setState(() {
            _selectedIndex = index;
          });
          if (index == 0) {
            // Navigate to Home page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => landingapp()),
            );
          } else if (index == 1) {
            // Navigate to Notifications page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NotificationPage()),
            );
          } else if (index == 2) {
            // Navigate to Profile page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EditProfilePage()),
            );
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  void setState(Null Function() param0) {}
}

class CardWithIcon extends StatelessWidget {
  final String imagePath;
  final String text;

  const CardWithIcon({Key? key, required this.imagePath, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          imagePath,
          width: 80, // Ubah ukuran ikon sesuai keinginan Anda
          height: 80, // Ubah ukuran ikon sesuai keinginan Anda
        ),
        SizedBox(height: 5),
        Text(
          text,
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
