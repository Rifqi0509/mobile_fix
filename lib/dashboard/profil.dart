import 'package:flutter/material.dart';

void main() {
  runApp(const EditProfilePage());
}

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Edit Profile'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context); // Kembali ke halaman sebelumnya
            },
          ),
        ),
        body: const EditProfileForm(),
      ),
    );
  }
}

class EditProfileForm extends StatefulWidget {
  const EditProfileForm({super.key});

  @override
  _EditProfileFormState createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  // Simpan data dari form
  String _username = '';
  String _email = '';
  String _alamat = '';
  String _telepon = '';

  // Simpan path gambar
  final String _imagePath =
      'Asset/image/profil.jpg'; // Ganti dengan path gambar default Anda

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, // Set latar belakang putih
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Stack(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey[300],
                child: Align(
                  child: CircleAvatar(
                    radius: 48,
                    backgroundImage: AssetImage(_imagePath),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.camera_alt),
                    onPressed: () {
                      // Tambahkan logika untuk mengambil foto profil
                      print('Ambil foto profil');
                    },
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5.0), // Jarak antara foto profil dan teks
          const Text(
            'Edit Photo Profile',
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.blueAccent,
            ),
          ),
          const SizedBox(height: 20.0),
          _buildTextFieldWithShadow('User Name', onChanged: (value) {
            setState(() {
              _username = value;
            });
          }),
          const SizedBox(height: 15.0),
          _buildTextFieldWithShadow('Email', onChanged: (value) {
            setState(() {
              _email = value;
            });
          }),
          const SizedBox(height: 15.0),
          _buildTextFieldWithShadow('Alamat', onChanged: (value) {
            setState(() {
              _alamat = value;
            });
          }),
          const SizedBox(height: 15.0),
          _buildTextFieldWithShadow('Nomor Telepon', onChanged: (value) {
            setState(() {
              _telepon = value;
            });
          }),
          const SizedBox(height: 20.0),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text(
                    'Simpan',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  onPressed: () {
                    // Lakukan sesuatu dengan data yang disimpan
                    print('User Name: $_username');
                    print('Email: $_email');
                    print('Alamat: $_alamat');
                    print('Nomor Telepon: $_telepon');
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTextFieldWithShadow(String labelText,
      {ValueChanged<String>? onChanged}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: TextFormField(
          decoration: InputDecoration(
            labelText: labelText,
            border: InputBorder.none,
          ),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
