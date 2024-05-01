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
        ),
        body: const KunjunganCard(),
      ),
    );
  }
}

class Kunjungan {
  final String kdUndangan;
  final String nama;
  final String alamat;
  final String asalInstansi;
  final String noHp;
  final String keperluan;
  final String departemen;
  final String seksi;
  final String tanggal;
  final String status;
  final String ket;

  Kunjungan({
    required this.kdUndangan,
    required this.nama,
    required this.alamat,
    required this.asalInstansi,
    required this.noHp,
    required this.keperluan,
    required this.departemen,
    required this.seksi,
    required this.tanggal,
    required this.status,
    required this.ket,
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
    // Your list of Kunjungan objects...
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
                headingRowColor: MaterialStateColor.resolveWith(
                  (states) => Color.fromRGBO(129, 129, 65, 1),
                ),
                dataRowHeight: 60.0,
                columns: const [
                  DataColumn(
                      label: Text('No',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ))),
                  DataColumn(
                      label: Text('Nama',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ))),
                  DataColumn(
                      label: Text('Alamat',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ))),
                  DataColumn(
                      label: Text('Asal Instansi',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ))),
                  DataColumn(
                      label: Text('No. HP',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ))),
                  DataColumn(
                      label: Text('Keperluan',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ))),
                  DataColumn(
                      label: Text('Departemen',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ))),
                  DataColumn(
                      label: Text('Seksi',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ))),
                  DataColumn(
                      label: Text('Tanggal Kunjungan',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ))),
                  DataColumn(
                      label: Text('Status',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ))),
                  DataColumn(
                      label: Text('Kode Undangan',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ))),
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
      if (kunjungan.status == 'Disetujui') {
        statusColor = Colors.green;
      } else if (kunjungan.status == 'Menunggu Persetujuan') {
        statusColor = Colors.orange;
      } else if (kunjungan.status == 'Ditolak') {
        statusColor = Colors.red;
      } else if (kunjungan.status == 'Selesai') {
        statusColor = Colors.blue;
      }

      return DataRow(
        cells: [
          DataCell(Text(kunjungan.kdUndangan)),
          DataCell(Text(kunjungan.nama)),
          DataCell(Text(kunjungan.alamat)),
          DataCell(Text(kunjungan.asalInstansi)),
          DataCell(Text(kunjungan.noHp)),
          DataCell(Text(kunjungan.keperluan)),
          DataCell(Text(kunjungan.departemen)),
          DataCell(Text(kunjungan.seksi)),
          DataCell(Text(kunjungan.tanggal)),
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
          DataCell(Text(kunjungan.ket)),
        ],
      );
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
}
