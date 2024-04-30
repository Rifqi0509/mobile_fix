import 'dart:math';
import 'package:flutter/material.dart';
import 'package:pantau_pro/register/Home_page.dart';

void main() {
  runApp(const RiwayatApp());
}

class RiwayatApp extends StatelessWidget {
  const RiwayatApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          title: Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                icon: Icon(Icons.arrow_back),
              ),
              const SizedBox(width: 8.0),
              const Text('Riwayat Pengajuan'),
            ],
          ),
          actions: [
            Container(
              constraints: BoxConstraints(maxWidth: 200),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  const SizedBox(width: 8.0),
                  Icon(Icons.search, color: Colors.grey),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: TextField(
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        hintText: 'Cari...',
                        border: InputBorder.none,
                        isDense: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        body: const KunjunganCard(),
      ),
    );
  }
}

class Kunjungan {
  final int no;
  final String nama;
  final String alamat;
  final String keperluan;
  final String asalInstansi;
  final String noHp;
  final String tanggal;
  final String departemen;
  final String seksi;
  final String status;
  final String ket;
  final String kodeUndangan;

  Kunjungan({
    required this.no,
    required this.nama,
    required this.alamat,
    required this.keperluan,
    required this.asalInstansi,
    required this.noHp,
    required this.tanggal,
    required this.departemen,
    required this.seksi,
    required this.status,
    required this.ket,
    required this.kodeUndangan,
  });
}

class KunjunganCard extends StatefulWidget {
  const KunjunganCard({Key? key});

  @override
  _KunjunganCardState createState() => _KunjunganCardState();
}

class _KunjunganCardState extends State<KunjunganCard> {
  DateTime? _selectedDate;
  late List<Kunjungan> filteredKunjunganList;

  final List<Kunjungan> kunjunganList = [
    Kunjungan(
      no: 1,
      nama: 'Nama X',
      alamat: 'Alamat X',
      keperluan: 'Keperluan X',
      asalInstansi: 'Instansi X',
      noHp: '1234567890',
      tanggal: '2024-04-20',
      departemen: 'Sales',
      seksi: 'Seksi X',
      status: 'Disetujui',
      ket: 'Keterangan X',
      kodeUndangan: generateRandomCode(),
    ),
    Kunjungan(
      no: 2,
      nama: 'Nama Y',
      alamat: 'Alamat Y',
      keperluan: 'Keperluan Y',
      asalInstansi: 'Instansi Y',
      noHp: '0987654321',
      tanggal: '2024-04-22',
      departemen: 'Marketing',
      seksi: 'Seksi Y',
      status: 'Disetujui',
      ket: 'Keterangan Y',
      kodeUndangan: generateRandomCode(),
    ),
    Kunjungan(
      no: 3,
      nama: 'Nama Z',
      alamat: 'Alamat Z',
      keperluan: 'Keperluan Z',
      asalInstansi: 'Instansi Z',
      noHp: '1357924680',
      tanggal: '2024-04-23',
      departemen: 'Human Resources',
      seksi: 'Seksi Z',
      status: 'Ditolak',
      ket: 'Keterangan Z',
      kodeUndangan: '',
    ),
    Kunjungan(
      no: 4,
      nama: 'Nama W',
      alamat: 'Alamat W',
      keperluan: 'Keperluan W',
      asalInstansi: 'Instansi W',
      noHp: '2468013579',
      tanggal: '2024-04-24',
      departemen: 'Training',
      seksi: 'Seksi W',
      status: 'Disetujui',
      ket: 'Keterangan W',
      kodeUndangan: generateRandomCode(),
    ),
  ];

  @override
  void initState() {
    super.initState();
    filteredKunjunganList = kunjunganList;
  }

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
                      label: Text('Nama',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Alamat',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Keperluan',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Instansi Asal',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('No. HP',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Tanggal Kunjungan',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Departemen',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Seksi',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Status',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Keterangan',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Kode Undangan',
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
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
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
    return filteredKunjunganList
        .where((kunjungan) =>
            _selectedDate == null ||
            kunjungan.tanggal == _selectedDate.toString().substring(0, 10))
        .map((kunjungan) {
      Color statusColor = Colors.black;
      bool canRedeem = false;
      String kodeUndangan = kunjungan.kodeUndangan;

      if (kunjungan.status == 'Disetujui') {
        statusColor = Colors.green;
        canRedeem = true;
        kodeUndangan = generateRandomCode();
      } else if (kunjungan.status == 'Menunggu Persetujuan') {
        statusColor = Colors.orange;
      } else if (kunjungan.status == 'Ditolak') {
        statusColor = Colors.red;
      } else if (kunjungan.status == 'Selesai') {
        statusColor = Colors.blue;
      }

      return DataRow(cells: [
        DataCell(Text(kunjungan.no.toString())),
        DataCell(Text(kunjungan.nama)),
        DataCell(Text(kunjungan.alamat)),
        DataCell(Text(kunjungan.keperluan)),
        DataCell(Text(kunjungan.asalInstansi)),
        DataCell(Text(kunjungan.noHp)),
        DataCell(Text(kunjungan.tanggal)),
        DataCell(Text(kunjungan.departemen)),
        DataCell(Text(kunjungan.seksi)),
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
          Text(kunjungan.ket),
        ),
        DataCell(
          canRedeem ? Text(kodeUndangan) : const Text('-'),
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
