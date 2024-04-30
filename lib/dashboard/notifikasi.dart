import 'package:flutter/material.dart';
import 'dart:math';

import 'package:pantau_pro/dashboard/riwayat.dart';
import 'package:pantau_pro/register/Home_page.dart';

void main() {
  runApp(const NotificationPage());
}

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> notifications = [
      {
        'status': 'Disetujui',
        'code': generateRandomCode(),
        'date': DateTime(2024, 4, 25)
      },
      {'status': 'Ditolak', 'date': DateTime(2024, 4, 24)},
      {
        'status': 'Disetujui',
        'code': generateRandomCode(),
        'date': DateTime(2024, 4, 23)
      },
      {'status': 'Ditolak', 'date': DateTime(2024, 4, 22)},
      {
        'status': 'Disetujui',
        'code': generateRandomCode(),
        'date': DateTime(2024, 4, 21)
      },
    ]; // Contoh daftar notifikasi

    // Mengurutkan notifikasi berdasarkan tanggal (dari yang terbaru ke yang terlama)
    notifications.sort((a, b) => b['date'].compareTo(a['date']));

    return MaterialApp(
      title: 'Notification Page',
      theme: ThemeData(
        primaryColor: Colors.blueGrey[900],
        hintColor: Colors.blueGrey[900],
        textTheme: const TextTheme(
          titleLarge: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.black87),
          titleMedium: TextStyle(fontSize: 16.0, color: Colors.black87),
          bodyLarge: TextStyle(fontSize: 14.0, color: Colors.black54),
        ),
      ),
      home: NotificationHomePage(notifications: notifications),
    );
  }
}

class NotificationHomePage extends StatelessWidget {
  final List<Map<String, dynamic>> notifications;

  const NotificationHomePage({super.key, required this.notifications});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifikasi'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 8.0, horizontal: 16.0), // Mengurangi padding
            child: SizedBox(
              width: double.infinity,
              child: _buildNotificationItem(context, notifications[index]),
            ),
          );
        },
      ),
    );
  }

  Widget _buildNotificationItem(
      BuildContext context, Map<String, dynamic> notification) {
    String status = notification['status']
        .toLowerCase(); // Mengonversi status menjadi huruf kecil
    String? code = notification['code'];

    Color notificationColor = status == 'disetujui'
        ? Colors.green
        : Colors.red; // Perbaikan perbandingan status

    String formattedDate =
        '${notification['date'].day}/${notification['date'].month}/${notification['date'].year}'; // Format tanggal notifikasi

    return Container(
      decoration: BoxDecoration(
        border:
            Border.all(color: Colors.grey[300]!), // Menambah border berwarna
        borderRadius: BorderRadius.circular(10), // Mengubah border-radius
      ),
      padding: const EdgeInsets.all(16.0), // Mengubah padding
      child: ListTile(
        title: Text(
          'Permohonan ${status.toUpperCase()}', // Mengubah status menjadi huruf besar
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: notificationColor,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            code != null ? Text('Kode Unik: $code') : const SizedBox(),
            Text('Tanggal: $formattedDate'),
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const RiwayatApp()),
          );
        },
      ),
    );
  }
}

String generateRandomCode() {
  Random random = Random();
  String alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  String code = '';
  for (int i = 0; i < 6; i++) {
    code += alphabet[random.nextInt(alphabet.length)];
  }
  return code;
}
