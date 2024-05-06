import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(FeedbackPage());
}

class FeedbackPage extends StatelessWidget {
  FeedbackPage({Key? key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  Future<void> sendFeedback(String email, String message) async {
    var url = Uri.parse('http://localhost:8000/api/feedback_flutter');
    var response =
        await http.post(url, body: {'email': email, 'message': message});

    if (response.statusCode == 200) {
      print('Feedback terkirim!');
    } else {
      print('Gagal mengirim feedback. Status code: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feedback'),
      ),
      backgroundColor: Colors.white, // Set background color to white
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Berikan Masukan Anda',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Alamat Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: _messageController,
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: 'Pesan',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                sendFeedback(_emailController.text, _messageController.text);
                _showFeedbackSentSnackbar(context);
                Navigator.pop(context);
              },
              child: const Text('Kirim'),
            ),
          ],
        ),
      ),
    );
  }

  void _showFeedbackSentSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Feedback telah terkirim!'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
