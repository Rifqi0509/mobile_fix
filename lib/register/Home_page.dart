import 'package:flutter/material.dart';
import 'package:pantau_pro/dashboard/profile.dart';
import 'package:pantau_pro/register/login.dart';
import 'package:pantau_pro/view/landing.dart';
import 'package:pantau_pro/dashboard/kunjungan.dart';
import 'package:pantau_pro/dashboard/feedback.dart';
import 'package:pantau_pro/dashboard/riwayat.dart';

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
            padding: const EdgeInsets.fromLTRB(
                40, 30, 40, 0), // Ubah sesuai kebutuhan
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                      color: const Color.fromARGB(
                          255, 255, 255, 255)!), // Warna border
                ),
              ),
              onChanged: (value) {
                // Tambahkan fungsi untuk memperbarui hasil pencarian di sini
              },
            ),
          ),
          SizedBox(height: 20),
          Card(
            // Memperbarui widget Card dengan Container
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'Asset/image/background.jpg'), // Ganti dengan path gambar Anda
                  fit: BoxFit.cover, // Mengatur penyesuaian gambar
                ),
                borderRadius:
                    BorderRadius.circular(15), // Border radius untuk Card
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
                    primary: Colors.white, // Warna background
                    onPrimary: Colors.black, // Warna teks
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: CardWithIcon(
                    icon: Icons.note,
                    text: 'Buat Kunjungan',
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfileScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white, // Warna background
                    onPrimary: Colors.black, // Warna teks
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: CardWithIcon(
                    icon: Icons.person,
                    text: 'Lihat Profil',
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
                    primary: Colors.white, // Warna background
                    onPrimary: Colors.black, // Warna teks
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: CardWithIcon(
                    icon: Icons.comment, // Icon comment
                    text: 'Feedback', // Teks Feedback
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RiwayatApp()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white, // Warna background
                    onPrimary: Colors.black, // Warna teks
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: CardWithIcon(
                    icon: Icons.save,
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
            // Navigasi ke halaman Home
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => landingapp()),
            );
          } else if (index == 1) {
            // Navigasi ke halaman Notifications
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => KunjunganPage()),
            );
          } else if (index == 2) {
            // Navigasi ke halaman Profile
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home), // Icon home
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications), // Icon notifikasi
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person), // Icon profil
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  void setState(Null Function() param0) {}
}

class CardWithIcon extends StatelessWidget {
  final IconData icon;
  final String text;

  const CardWithIcon({Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment:
          MainAxisAlignment.center, // Menengahkan konten secara vertikal
      children: [
        Icon(
          icon,
          size: 60, // Mengurangi ukuran ikon
          color: Colors.orange, // Mengubah warna ikon
        ),
        SizedBox(height: 5), // Mengurangi jarak antara ikon dan teks
        Text(
          text,
          style: TextStyle(fontSize: 16), // Mengurangi ukuran teks
          textAlign: TextAlign.center, // Menengahkan teks secara horizontal
        ),
      ],
    );
  }
}
