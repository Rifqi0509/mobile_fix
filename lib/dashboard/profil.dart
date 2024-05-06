import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const EditProfilePage());
}

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late Future<UserData> _userDataFuture;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context); // Kembali ke halaman sebelumnya
            },
          ),
        ),
        body: FutureBuilder<UserData>(
          future: _userDataFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              UserData userData = snapshot.data!;
              return EditProfileForm(userData: userData);
            }
          },
        ),
      ),
    );
  }
}

class EditProfileForm extends StatelessWidget {
  final UserData userData;

  const EditProfileForm({Key? key, required this.userData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text('User Name: ${userData.username}'),
          Text('Email: ${userData.email}'),
          Text('Alamat: ${userData.alamat}'),
          Text('Nomor Telepon: ${userData.telepon}'),
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              // Tambahkan logika untuk menyimpan data
              print('Data saved!');
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

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      username: json['username'],
      email: json['email'],
      alamat: json['alamat'],
      telepon: json['telepon'],
    );
  }
}
