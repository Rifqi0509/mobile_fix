import 'package:flutter/material.dart';
import 'package:pantau_pro/register/Home_page.dart';

void main() {
  runApp(const SurveyApp());
}

class SurveyApp extends StatelessWidget {
  const SurveyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SurveyPage(),
    );
  }
}

class SurveyPage extends StatefulWidget {
  const SurveyPage({Key? key}) : super(key: key);

  @override
  _SurveyPageState createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  final List<String?> _selectedAnswers = List.filled(10, null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            const Text('Survey Kepuasan'),
          ],
        ),
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
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
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _showSnackbar(context);
                },
                child: const Text('Kirim Jawaban'),
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
          margin: const EdgeInsets.only(bottom: 10.0),
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Text(
            question,
            style: const TextStyle(
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
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5.0),
        color: _selectedAnswers[index] == option
            ? const Color.fromARGB(255, 123, 206, 255).withOpacity(0.3)
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
      const SnackBar(
        content: Text('Terima kasih atas partisipasi Anda!'),
      ),
    );
    // Navigasi langsung ke halaman home setelah menampilkan Snackbar
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }
}
