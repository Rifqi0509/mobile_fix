import 'package:flutter/material.dart';

void main() {
  runApp(TutorialApp());
}

class TutorialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tutorial App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TutorialScreen(),
    );
  }
}

class TutorialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tutorial Penggunaan Aplikasi'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TutorialStep(
              title: 'Langkah untuk Login',
              description: '1. Buka aplikasi.\n'
                  '2. Masukkan nama pengguna (username) dan kata sandi (password).\n'
                  '3. Tekan tombol "Login".',
            ),
            SizedBox(height: 20.0),
            TutorialStep(
              title: 'Langkah untuk Register',
              description: '1. Buka aplikasi.\n'
                  '2. Tekan tombol "Register" di layar login.\n'
                  '3. Masukkan informasi yang diperlukan seperti nama, email, dan kata sandi.\n'
                  '4. Tekan tombol "Submit" untuk menyelesaikan proses pendaftaran.',
            ),
            SizedBox(height: 20.0),
            TutorialStep(
              title: 'Langkah untuk Membuat Kunjungan',
              description:
                  '1. Setelah login, akan muncul layar utama aplikasi.\n'
                  '2. Tekan tombol "Buat Kunjungan".\n'
                  '3. Masukkan informasi yang diperlukan seperti nama tamu, tujuan kunjungan, dll.\n'
                  '4. Tekan tombol "Submit" untuk menyimpan kunjungan.',
            ),
            SizedBox(height: 20.0),
            TutorialStep(
              title: 'Langkah untuk Memberikan Survey',
              description:
                  '1. Setelah kunjungan selesai, akan muncul opsi untuk memberikan survey.\n'
                  '2. Pilih opsi survey yang diinginkan, misalnya "Puas", "Biasa saja", atau "Tidak puas".\n'
                  '3. Tekan tombol "Submit" untuk menyimpan survey.',
            ),
          ],
        ),
      ),
    );
  }
}

class TutorialStep extends StatelessWidget {
  final String title;
  final String description;

  TutorialStep({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              description,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
