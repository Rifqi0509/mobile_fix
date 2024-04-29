import 'package:flutter/material.dart';
import 'package:pantau_pro/register/Home_page.dart';

class KunjunganPage extends StatefulWidget {
  const KunjunganPage({super.key});

  @override
  _KunjunganPageState createState() => _KunjunganPageState();
}

class _KunjunganPageState extends State<KunjunganPage> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();
  final TextEditingController _tujuanController = TextEditingController();
  final TextEditingController _perusahaanController = TextEditingController();
  final TextEditingController _kontakController = TextEditingController();
  final TextEditingController _pihakController =
      TextEditingController(); // Controller for selected pihak
  DateTime _selectedDate = DateTime.now(); // Menyimpan tanggal kunjungan
  TimeOfDay _selectedTime = TimeOfDay.now(); // Menyimpan waktu kunjungan
  String _selectedPihak = ''; // Menyimpan pilihan pihak yang ingin ditemui

  // Flags to track whether each field is filled
  bool _namaIsFilled = false;
  bool _alamatIsFilled = false;
  bool _tujuanIsFilled = false;
  bool _perusahaanIsFilled = false;
  bool _kontakIsFilled = false;
  bool _pihakIsSelected =
      false; // Menyimpan status pemilihan pihak yang ingin ditemui

  // Daftar pilihan pihak yang ingin ditemui
  final List<String> _pihakOptions = [
    'Pilih Pihak yang Ingin Ditemui',
    'Departemen A',
    'Departemen B',
    'Departemen C',
    // Tambahkan divisi lain jika diperlukan
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Form Kunjungan'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Nama TextField
                      const Text(
                        'Nama *',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _namaController,
                        onChanged: (value) {
                          setState(() {
                            _namaIsFilled = value.isNotEmpty;
                          });
                        },
                        decoration: const InputDecoration(
                          hintText: 'Masukkan nama',
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                      // Show warning if nama is not filled
                      if (!_namaIsFilled)
                        const Padding(
                          padding: EdgeInsets.only(top: 4.0),
                          child: Text(
                            'Nama harus diisi!',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      const SizedBox(height: 20),
                      // Alamat TextField
                      const Text(
                        'Alamat *',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _alamatController,
                        onChanged: (value) {
                          setState(() {
                            _alamatIsFilled = value.isNotEmpty;
                          });
                        },
                        decoration: const InputDecoration(
                          hintText: 'Masukkan alamat',
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                      // Show warning if alamat is not filled
                      if (!_alamatIsFilled)
                        const Padding(
                          padding: EdgeInsets.only(top: 4.0),
                          child: Text(
                            'Alamat harus diisi!',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      const SizedBox(height: 20),
                      // Tujuan Kunjungan TextField
                      const Text(
                        'Tujuan Kunjungan *',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _tujuanController,
                        onChanged: (value) {
                          setState(() {
                            _tujuanIsFilled = value.isNotEmpty;
                          });
                        },
                        decoration: const InputDecoration(
                          hintText: 'Masukkan tujuan kunjungan',
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                      // Show warning if tujuan kunjungan is not filled
                      if (!_tujuanIsFilled)
                        const Padding(
                          padding: EdgeInsets.only(top: 4.0),
                          child: Text(
                            'Tujuan kunjungan harus diisi!',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      const SizedBox(height: 20),
                      // Asal Instansi TextField
                      const Text(
                        'Asal Instansi *',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _perusahaanController,
                        onChanged: (value) {
                          setState(() {
                            _perusahaanIsFilled = value.isNotEmpty;
                          });
                        },
                        decoration: const InputDecoration(
                          hintText: 'Masukkan nama Instansi',
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                      // Show warning if asal instansi is not filled
                      if (!_perusahaanIsFilled)
                        const Padding(
                          padding: EdgeInsets.only(top: 4.0),
                          child: Text(
                            'Asal Instansi harus diisi!',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      const SizedBox(height: 20),
                      // Nomor Telepon TextField
                      const Text(
                        'Nomor Telepon *',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _kontakController,
                        onChanged: (value) {
                          setState(() {
                            _kontakIsFilled = value.isNotEmpty;
                          });
                        },
                        decoration: const InputDecoration(
                          hintText: 'Masukkan Nomor Telepon',
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                      // Show warning if nomor telepon is not filled
                      if (!_kontakIsFilled)
                        const Padding(
                          padding: EdgeInsets.only(top: 4.0),
                          child: Text(
                            'Nomor Telepon harus diisi!',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      const SizedBox(height: 20),
                      // Pihak yang Ingin Ditemui TextField
                      const Text(
                        'Pihak yang Ingin Ditemui *',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _pihakController,
                        onChanged: (value) {
                          setState(() {
                            _pihakIsSelected = value.isNotEmpty;
                          });
                        },
                        decoration: const InputDecoration(
                          hintText: 'Pilih Pihak yang Ingin Ditemui',
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        onTap: () {
                          _selectPihak(context);
                        },
                      ),
                      // Show warning if pihak yang ingin ditemui is not selected
                      if (!_pihakIsSelected)
                        const Padding(
                          padding: EdgeInsets.only(top: 4.0),
                          child: Text(
                            'Pihak yang ingin ditemui harus dipilih!',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      const SizedBox(height: 20),
                      // Tanggal Kunjungan Picker
                      const Text(
                        'Tanggal Kunjungan *',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          _selectDate(context);
                        },
                        child: InputDecorator(
                          decoration: const InputDecoration(
                            hintText: 'Pilih Tanggal Kunjungan',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "${_selectedDate.toLocal()}".split(' ')[0],
                                style: const TextStyle(fontSize: 16),
                              ),
                              const Icon(Icons.calendar_today),
                            ],
                          ),
                        ),
                      ),

                      // Waktu Kunjungan Picker
                      const Text(
                        'Waktu Kunjungan *',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          _selectTime(context);
                        },
                        child: InputDecorator(
                          decoration: const InputDecoration(
                            hintText: 'Pilih Waktu Kunjungan',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                _selectedTime.format(context),
                                style: const TextStyle(fontSize: 16),
                              ),
                              const Icon(Icons.access_time),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // Validate form before navigating
                            if (_validateForm()) {
                              // Navigate to home page if form is complete
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'Ajukan Kunjungan',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Validate form method
  bool _validateForm() {
    // Check if all required fields are filled
    return _namaIsFilled &&
        _alamatIsFilled &&
        _tujuanIsFilled &&
        _perusahaanIsFilled &&
        _kontakIsFilled &&
        _pihakIsSelected;
  }

  // Date and time picker methods
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  // Select pihak method
  Future<void> _selectPihak(BuildContext context) async {
    String? selectedPihak = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pilih Pihak yang Ingin Ditemui'),
          content: DropdownButtonFormField<String>(
            items: _pihakOptions.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? value) {
              Navigator.pop(context, value);
            },
          ),
        );
      },
    );

    if (selectedPihak != null) {
      setState(() {
        _selectedPihak = selectedPihak;
        _pihakController.text = selectedPihak;
        _pihakIsSelected = true;
      });
    }
  }

  @override
  void dispose() {
    _namaController.dispose();
    _alamatController.dispose();
    _tujuanController.dispose();
    _perusahaanController.dispose();
    _kontakController.dispose();
    _pihakController.dispose(); // Dispose controller for pihak
    super.dispose();
  }
}
