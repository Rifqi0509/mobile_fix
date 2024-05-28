import 'package:flutter/material.dart';

void main() {
  runApp(const EditProfilePage());
}

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context); // Go back to the previous screen
            },
          ),
        ),
        body: const EditProfileForm(),
      ),
    );
  }
}

class EditProfileForm extends StatefulWidget {
  const EditProfileForm({Key? key}) : super(key: key);

  @override
  _EditProfileFormState createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  late TextEditingController _usernameController;
  late TextEditingController _namaController;
  late TextEditingController _emailController;
  late TextEditingController _addressController;
  late TextEditingController _phoneNumberController;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _namaController = TextEditingController();
    _emailController = TextEditingController();
    _addressController = TextEditingController();
    _phoneNumberController = TextEditingController();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _namaController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  void _editProfilePicture() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Take a picture'),
              onTap: () {
                // Handle taking a new picture
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Pilih Foto Dari Galeri'),
              onTap: () {
                // Handle picking from gallery
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
                'https://via.placeholder.com/150'), // Replace with your image URL or asset
          ),
          const SizedBox(height: 10.0),
          TextButton(
            onPressed: _editProfilePicture,
            child: const Text(
              'Edit Profile',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          TextField(
            controller: _usernameController,
            decoration: const InputDecoration(labelText: 'User Name'),
          ),
          TextField(
            controller: _namaController,
            decoration: const InputDecoration(labelText: 'Nama'),
          ),
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          TextField(
            controller: _addressController,
            decoration: const InputDecoration(labelText: 'Alamat'),
          ),
          TextField(
            controller: _phoneNumberController,
            decoration: const InputDecoration(labelText: 'Nomor Telepon'),
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              // Add logic to save data
              print('Data saved!');
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
