import 'package:flutter/material.dart';

void main() {
  runApp(riwayatapp());
}

class riwayatapp extends StatelessWidget {
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
  final int no;
  final String tanggal;
  final String nama;
  final String tujuan;
  final String status;
  final String? kodeUnik; // Ubah menjadi opsional dengan tanda tanya (?)

  Kunjungan({
    required this.no,
    required this.tanggal,
    required this.nama,
    required this.tujuan,
    required this.status,
    this.kodeUnik, // Buat opsional
  });
}

class KunjunganCard extends StatelessWidget {
  final List<Kunjungan> kunjunganList = [
    Kunjungan(
      no: 1,
      tanggal: '2024-04-20',
      nama: 'John Doe',
      tujuan: 'Pertemuan bisnis',
      status: 'Disetujui',
      kodeUnik: 'ABC123',
    ),
    Kunjungan(
      no: 2,
      tanggal: '2024-04-22',
      nama: 'Jane Smith',
      tujuan: 'Wawancara',
      status: 'Menunggu Persetujuan',
    ),
    Kunjungan(
      no: 3,
      tanggal: '2024-04-23',
      nama: 'Ahmad Abdullah',
      tujuan: 'Kunjungan pribadi',
      status: 'Ditolak',
    ),
    Kunjungan(
      no: 4,
      tanggal: '2024-04-24',
      nama: 'Emma Lee',
      tujuan: 'Pelatihan',
      status: 'Selesai',
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
                label: Text('Tanggal Kunjungan',
                    style: TextStyle(fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text('Nama Pengunjung',
                    style: TextStyle(fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text('Tujuan Kunjungan',
                    style: TextStyle(fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text('Status',
                    style: TextStyle(fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text('Kode Unik',
                    style: TextStyle(fontWeight: FontWeight.bold))),
          ],
          rows: kunjunganList.map((kunjungan) {
            Color statusColor =
                Colors.black; // Default color jika status tidak cocok

            // Memberi warna sesuai dengan status
            if (kunjungan.status == 'Disetujui') {
              statusColor = Colors.green;
            } else if (kunjungan.status == 'Menunggu Persetujuan') {
              statusColor = Colors.orange;
            } else if (kunjungan.status == 'Ditolak') {
              statusColor = Colors.red;
            } else if (kunjungan.status == 'Selesai') {
              statusColor = Colors.blue;
            }

            return DataRow(cells: [
              DataCell(Text(kunjungan.no.toString())),
              DataCell(Text(kunjungan.tanggal)),
              DataCell(Text(kunjungan.nama)), // Tampilkan nama pengunjung
              DataCell(Text(kunjungan.tujuan)), // Tampilkan tujuan kunjungan
              DataCell(
                Container(
                  padding: EdgeInsets.all(8), // Memberikan padding pada kotak
                  decoration: BoxDecoration(
                    color: statusColor, // Memberikan warna sesuai dengan status
                    borderRadius:
                        BorderRadius.circular(5), // Memberikan sudut kotak
                  ),
                  child: Text(
                    kunjungan.status,
                    style: TextStyle(
                        color:
                            Colors.white), // Mengatur warna teks di dalam kotak
                  ),
                ),
              ),
              DataCell(Text(kunjungan.kodeUnik ??
                  '')), // Tambahkan ?? '' agar tidak error jika kodeUnik null
            ]);
          }).toList(),
        ),
      ),
    );
  }
}
