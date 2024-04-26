import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(NotificationPage());
}

class NotificationPage extends StatelessWidget {
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
        textTheme: TextTheme(
          headline6: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.black87),
          subtitle1: TextStyle(fontSize: 16.0, color: Colors.black87),
          bodyText1: TextStyle(fontSize: 14.0, color: Colors.black54),
        ),
      ),
      home: NotificationHomePage(notifications: notifications),
    );
  }
}

class NotificationHomePage extends StatelessWidget {
  final List<Map<String, dynamic>> notifications;

  NotificationHomePage({required this.notifications});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifikasi'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RiwayatApp()),
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
      padding: EdgeInsets.all(16.0), // Mengubah padding
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
            code != null ? Text('Kode Unik: $code') : SizedBox(),
            Text('Tanggal: $formattedDate'),
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RiwayatApp()),
          );
        },
      ),
    );
  }
}

class RiwayatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Riwayat Pengajuan'),
        ),
        body: KunjunganCard(),
      ),
    );
  }
}

class Kunjungan {
  final String status;
  final String? code; // Make it optional to match the notification structure
  final DateTime date;

  Kunjungan({
    required this.status,
    this.code,
    required this.date,
  });
}

class KunjunganCard extends StatelessWidget {
  final List<Kunjungan> kunjunganList = [
    Kunjungan(
      status: 'Disetujui',
      code: generateRandomCode(),
      date: DateTime(2024, 4, 25),
    ),
    Kunjungan(
      status: 'Ditolak',
      date: DateTime(2024, 4, 24),
    ),
    Kunjungan(
      status: 'Disetujui',
      code: generateRandomCode(),
      date: DateTime(2024, 4, 23),
    ),
    Kunjungan(
      status: 'Ditolak',
      date: DateTime(2024, 4, 22),
    ),
    Kunjungan(
      status: 'Disetujui',
      code: generateRandomCode(),
      date: DateTime(2024, 4, 21),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Card(
        elevation: 4,
        child: DataTable(
          headingRowColor:
              MaterialStateColor.resolveWith((states) => Colors.orange),
          columns: [
            DataColumn(
                label:
                    Text('No', style: TextStyle(fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text('Tanggal',
                    style: TextStyle(fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text('Status',
                    style: TextStyle(fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text('Kode Unik',
                    style: TextStyle(fontWeight: FontWeight.bold))),
          ],
          rows: kunjunganList.map((kunjungan) {
            Color statusColor = Colors.black; // Default color

            if (kunjungan.status == 'Disetujui') {
              statusColor = Colors.green;
            } else if (kunjungan.status == 'Ditolak') {
              statusColor = Colors.red;
            }

            return DataRow(cells: [
              DataCell(Text(
                (kunjunganList.indexOf(kunjungan) + 1)
                    .toString(), // Adjust numbering
              )),
              DataCell(Text(
                '${kunjungan.date.day}/${kunjungan.date.month}/${kunjungan.date.year}',
              )),
              DataCell(
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: statusColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    kunjungan.status,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              DataCell(Text(kunjungan.code ?? '')),
            ]);
          }).toList(),
        ),
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
