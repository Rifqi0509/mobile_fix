import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const EditProfileApp());
}

class EditProfileApp extends StatelessWidget {
  const EditProfileApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const EditProfilePage(),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late UserData _userData;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // Panggil method untuk mengambil data pengguna dari backend saat halaman pertama kali dibuat
    _getUserData();
  }

  void _getUserData() async {
    try {
      // Lakukan request GET ke endpoint API Laravel
      final response =
          await http.get(Uri.parse('http://127.0.0.1:8000/api/user_flutter'));

      // Periksa status code dari response
      if (response.statusCode == 200) {
        final userData = json.decode(response.body)['user'];
        setState(() {
          _userData = UserData(
            username: userData['username'],
            email: userData['email'],
            alamat: userData['alamat'],
            telepon: userData['telepon'],
          );
        });
      } else {
        throw Exception('Failed to load user data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void _saveUserData(UserData userData) {
    // Implementasi logika untuk menyimpan data ke backend
    // Misalnya dengan method POST ke endpoint yang sesuai di backend

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Data saved!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Kembali ke halaman sebelumnya
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: EditProfileForm(
          userData: _userData,
          onSave: _saveUserData,
        ),
      ),
    );
  }
}

class EditProfileForm extends StatefulWidget {
  final UserData userData;
  final void Function(UserData) onSave;

  const EditProfileForm({
    Key? key,
    required this.userData,
    required this.onSave,
  }) : super(key: key);

  @override
  _EditProfileFormState createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  final _formKey = GlobalKey<FormState>();
  late String _username;
  late String _email;
  late String _alamat;
  late String _telepon;

  @override
  void initState() {
    super.initState();
    _username = widget.userData.username;
    _email = widget.userData.email;
    _alamat = widget.userData.alamat;
    _telepon = widget.userData.telepon;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            initialValue: _username,
            decoration: const InputDecoration(labelText: 'User Name'),
            onSaved: (value) => _username = value!,
          ),
          const SizedBox(height: 20.0),
          TextFormField(
            initialValue: _email,
            decoration: const InputDecoration(labelText: 'Email'),
            onSaved: (value) => _email = value!,
          ),
          const SizedBox(height: 20.0),
          TextFormField(
            initialValue: _alamat,
            decoration: const InputDecoration(labelText: 'Alamat'),
            onSaved: (value) => _alamat = value!,
          ),
          const SizedBox(height: 20.0),
          TextFormField(
            initialValue: _telepon,
            decoration: const InputDecoration(labelText: 'Nomor Telepon'),
            onSaved: (value) => _telepon = value!,
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                UserData updatedUserData = UserData(
                  username: _username,
                  email: _email,
                  alamat: _alamat,
                  telepon: _telepon,
                );
                widget.onSave(updatedUserData);
              }
            },
            child: const Text('Simpan'),
          ),
        ],
      ),
    );
  }
}

class UserData {
  final String username;
  final String email;
  final String alamat;
  final String telepon;

  UserData({
    required this.username,
    required this.email,
    required this.alamat,
    required this.telepon,
  });
}
