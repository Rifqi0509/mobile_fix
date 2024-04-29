import 'dart:math';
import 'package:flutter/material.dart';
import 'package:pantau_pro/register/Home_page.dart';

void main() {
  runApp(const riwayatapp());
}

class riwayatapp extends StatelessWidget {
  const riwayatapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Riwayat Pengajuan'),
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
        body: const KunjunganCard(),
      ),
    );
  }
}

class Kunjungan {
  final int no;
  final String tanggal;
  final String pihakYangDituju;
  final String departemen;
  final String tujuan;
  final String status;
  final String kodeUnik;

  Kunjungan({
    required this.no,
    required this.tanggal,
    required this.pihakYangDituju,
    required this.departemen,
    required this.tujuan,
    required this.status,
    required this.kodeUnik,
  });
}

class KunjunganCard extends StatefulWidget {
  const KunjunganCard({super.key});

  @override
  _KunjunganCardState createState() => _KunjunganCardState();
}

class _KunjunganCardState extends State<KunjunganCard> {
  DateTime? _selectedDate;

  final List<Kunjungan> kunjunganList = [
    Kunjungan(
      no: 1,
      tanggal: '2024-04-20',
      pihakYangDituju: 'Company X',
      departemen: 'Sales',
      tujuan: 'Pertemuan bisnis',
      status: 'Disetujui',
      kodeUnik: generateRandomCode(),
    ),
    Kunjungan(
      no: 2,
      tanggal: '2024-04-22',
      pihakYangDituju: 'Company Y',
      departemen: 'Marketing',
      tujuan: 'Wawancara',
      status: 'Menunggu Persetujuan',
      kodeUnik: generateRandomCode(),
    ),
    Kunjungan(
      no: 3,
      tanggal: '2024-04-23',
      pihakYangDituju: 'Company Z',
      departemen: 'Human Resources',
      tujuan: 'Kunjungan pribadi',
      status: 'Disetujui',
      kodeUnik: generateRandomCode(),
    ),
    Kunjungan(
      no: 4,
      tanggal: '2024-04-24',
      pihakYangDituju: 'Company W',
      departemen: 'Training',
      tujuan: 'Pelatihan',
      status: 'Disetujui',
      kodeUnik: generateRandomCode(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildFilterWidget(),
        const SizedBox(height: 16.0),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
              child: DataTable(
                headingRowColor:
                    MaterialStateColor.resolveWith((states) => Colors.orange),
                columns: const [
                  DataColumn(
                      label: Text('No',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Tanggal Kunjungan',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Departemen',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Pihak yang Dituju',
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
                rows: _buildDataRowList(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFilterWidget() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Filter berdasarkan tanggal:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8.0),
          ElevatedButton(
            onPressed: () => _selectDate(context),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(5.0), // Adjust the value as needed
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 10.0), // Adjust the value as needed
              child: Text(
                _selectedDate == null
                    ? 'Pilih Tanggal'
                    : 'Tanggal: ${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<DataRow> _buildDataRowList() {
    return kunjunganList
        .where((kunjungan) =>
            _selectedDate == null ||
            kunjungan.tanggal == _selectedDate.toString().substring(0, 10))
        .map((kunjungan) {
      Color statusColor = Colors.black;
      bool canRedeem = false; // Inisialisasi kode redeem

      if (kunjungan.status == 'Disetujui') {
        statusColor = Colors.green;
        canRedeem = true; // Jika disetujui, maka dapat redeem
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
        DataCell(Text(kunjungan.departemen)),
        DataCell(
            Text('${kunjungan.pihakYangDituju} (${kunjungan.departemen})')),
        DataCell(Text(kunjungan.tujuan)),
        DataCell(
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: statusColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              kunjungan.status,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        DataCell(
          canRedeem ? Text(kunjungan.kodeUnik) : const Text('-'),
        ),
      ]);
    }).toList();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  static String generateRandomCode() {
    final random = Random();
    const length = 6;
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    return String.fromCharCodes(Iterable.generate(
        length, (_) => chars.codeUnitAt(random.nextInt(chars.length))));
  }
}
