import 'package:flutter/material.dart';
import 'package:pantau_pro/register/Home_page.dart';

void main() {
  runApp(FeedbackPage());
}

class FeedbackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Feedback App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.white,
      ),
      home: FeedbackScreen(),
    );
  }
}

class FeedbackScreen extends StatefulWidget {
  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  TextEditingController _feedbackController = TextEditingController();
  String _feedback = '';
  List<String> _satisfactionQuestions = [
    'Seberapa puas Anda dengan layanan kami?',
    'Seberapa mudah Anda menggunakan aplikasi kami?',
    'Apakah Anda akan merekomendasikan aplikasi kami kepada orang lain?'
  ];
  List<String> _satisfactionAnswers = ['', '', ''];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Feedback'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            Text(
              'Survei Kepuasan:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Wrap(
              spacing: 10.0,
              runSpacing: 10.0,
              children: List.generate(
                _satisfactionQuestions.length,
                (index) => Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          _satisfactionQuestions[index],
                          style: TextStyle(fontSize: 16.0),
                        ),
                        SizedBox(height: 10.0),
                        // Menampilkan pilihan jawaban
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Radio(
                              value: 'Sangat Puas',
                              groupValue: _satisfactionAnswers[index],
                              onChanged: (value) {
                                setState(() {
                                  _satisfactionAnswers[index] = value!;
                                });
                              },
                            ),
                            Text('Sangat Puas'),
                            Radio(
                              value: 'Puas',
                              groupValue: _satisfactionAnswers[index],
                              onChanged: (value) {
                                setState(() {
                                  _satisfactionAnswers[index] = value!;
                                });
                              },
                            ),
                            Text('Puas'),
                            Radio(
                              value: 'Netral',
                              groupValue: _satisfactionAnswers[index],
                              onChanged: (value) {
                                setState(() {
                                  _satisfactionAnswers[index] = value!;
                                });
                              },
                            ),
                            Text('Netral'),
                            Radio(
                              value: 'Tidak Puas',
                              groupValue: _satisfactionAnswers[index],
                              onChanged: (value) {
                                setState(() {
                                  _satisfactionAnswers[index] = value!;
                                });
                              },
                            ),
                            Text('Tidak Puas'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Beri Kami Masukan',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _feedbackController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Masukan Anda',
                hintStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _feedback = value;
                });
              },
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Mengirim masukan
                _sendFeedback();
              },
              child: Text('Kirim Feedback'),
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }

  void _sendFeedback() {
    // Di sini Anda dapat menambahkan kode untuk mengirim feedback ke server atau penyimpanan lainnya.
    // Misalnya, Anda dapat menggunakan package http untuk mengirimkan feedback ke backend server.
    // Anda juga dapat menyimpan feedback lokal menggunakan shared_preferences atau database lokal.
    print('Feedback yang dikirim: $_feedback');
    // Mengosongkan field setelah mengirim feedback
    _feedbackController.clear();
    setState(() {
      _feedback = '';
      _satisfactionAnswers = [
        '',
        '',
        ''
      ]; // Mengosongkan jawaban survei kepuasan
    });

    // Menampilkan pesan feedback telah terkirim (opsional)
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Feedback telah terkirim! Terima kasih atas masukannya.'),
        duration: Duration(seconds: 2),
      ),
    );

    // Mengarahkan ke halaman beranda setelah menampilkan Snackbar
    Future.delayed(Duration(seconds: 0), () {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                HomePage()), // Ganti HomePage() dengan halaman beranda yang sesuai
      );
    });
  }
}
