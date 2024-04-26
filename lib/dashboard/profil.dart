import 'package:flutter/material.dart';

void main() {
  runApp(EditProfilePage());
}

class EditProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Edit Profile'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context); // Kembali ke halaman sebelumnya
            },
          ),
        ),
        body: EditProfileForm(),
      ),
    );
  }
}

class EditProfileForm extends StatefulWidget {
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
  String _imagePath =
      'Asset/image/profil.jpg'; // Ganti dengan path gambar default Anda

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, // Set latar belakang putih
      padding: EdgeInsets.all(20.0),
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
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.camera_alt),
                    onPressed: () {
                      // Tambahkan logika untuk mengambil foto profil
                      print('Ambil foto profil');
                    },
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 5.0), // Jarak antara foto profil dan teks
          Text(
            'Edit Photo Profile',
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.blueAccent,
            ),
          ),
          SizedBox(height: 20.0),
          _buildTextFieldWithShadow('User Name', onChanged: (value) {
            setState(() {
              _username = value;
            });
          }),
          SizedBox(height: 15.0),
          _buildTextFieldWithShadow('Email', onChanged: (value) {
            setState(() {
              _email = value;
            });
          }),
          SizedBox(height: 15.0),
          _buildTextFieldWithShadow('Alamat', onChanged: (value) {
            setState(() {
              _alamat = value;
            });
          }),
          SizedBox(height: 15.0),
          _buildTextFieldWithShadow('Nomor Telepon', onChanged: (value) {
            setState(() {
              _telepon = value;
            });
          }),
          SizedBox(height: 20.0),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text(
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
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
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
