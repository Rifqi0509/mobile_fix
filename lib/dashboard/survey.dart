import 'package:flutter/material.dart';
import 'package:pantau_pro/register/Home_page.dart';

void main() {
  runApp(SurveyApp());
}

class SurveyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SurveyPage(),
    );
  }
}

class SurveyPage extends StatefulWidget {
  @override
  _SurveyPageState createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  List<String?> _selectedAnswers = List.filled(10, null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Survey Kepuasan Aplikasi'),
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildQuestionAndOptions(
                  "1. Seberapa puas Anda dengan antarmuka pengguna aplikasi?",
                  0),
              _buildQuestionAndOptions(
                  "2. Seberapa puas Anda dengan kecepatan aplikasi?", 1),
              _buildQuestionAndOptions(
                  "3. Seberapa puas Anda dengan fitur-fitur yang disediakan?",
                  2),
              _buildQuestionAndOptions(
                  "4. Seberapa puas Anda dengan layanan pelanggan?", 3),
              _buildQuestionAndOptions(
                  "5. Seberapa puas Anda dengan kualitas konten aplikasi?", 4),
              _buildQuestionAndOptions(
                  "6. Seberapa puas Anda dengan kinerja aplikasi secara keseluruhan?",
                  5),
              _buildQuestionAndOptions(
                  "7. Seberapa puas Anda dengan keamanan aplikasi?", 6),
              _buildQuestionAndOptions(
                  "8. Seberapa puas Anda dengan frekuensi pembaruan aplikasi?",
                  7),
              _buildQuestionAndOptions(
                  "9. Seberapa puas Anda dengan notifikasi aplikasi?", 8),
              _buildQuestionAndOptions(
                  "10. Seberapa puas Anda dengan dokumentasi aplikasi?", 9),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _showSnackbar(context);
                },
                child: Text('Kirim Jawaban'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuestionAndOptions(String question, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 10.0),
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Text(
            question,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        _buildOptions(index),
      ],
    );
  }

  Widget _buildOptions(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildOption("Sangat Puas", index),
        _buildOption("Puas", index),
        _buildOption("Netral", index),
        _buildOption("Tidak Puas", index),
      ],
    );
  }

  Widget _buildOption(String option, int index) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5.0),
        color: _selectedAnswers[index] == option
            ? Color.fromARGB(255, 123, 206, 255).withOpacity(0.3)
            : null,
      ),
      child: ListTile(
        title: Text(option),
        onTap: () {
          setState(() {
            _selectedAnswers[index] = option;
          });
        },
      ),
    );
  }

  void _showSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Terima kasih atas partisipasi Anda!'),
      ),
    );
    // Navigasi langsung ke halaman home setelah menampilkan Snackbar
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }
}
