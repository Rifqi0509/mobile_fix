import 'package:flutter/material.dart';
import 'package:pantau_pro/register/Home_page.dart';

void main() {
  runApp(const NotificationPage());
}

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notification Page',
      theme: ThemeData(
        primaryColor: Colors.blueGrey[900],
        hintColor: Colors.blueGrey[900],
        textTheme: const TextTheme(
          headline6: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
          subtitle1: TextStyle(fontSize: 16.0, color: Colors.black87),
          bodyText2: TextStyle(fontSize: 14.0, color: Colors.black54),
        ),
      ),
      home: const NotificationHomePage(),
    );
  }
}

class NotificationHomePage extends StatelessWidget {
  const NotificationHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              icon: Icon(Icons.arrow_back),
            ),
            const SizedBox(width: 8.0),
            const Text('Notifikasi'),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          NotificationItem(
            title: 'Pengajuan anda telah disetujui',
            subtitle: 'Berikut kode anda: ABC123',
            time: '2 jam yang lalu',
            color: Colors.green,
          ),
          NotificationItem(
            title: 'Pengajuan anda tidak dapat disetujui',
            subtitle: 'Dengan catatan: Pihak yang dituju tidak dapat ditemui',
            time: 'Kemarin',
            color: Colors.red,
          ),
          // Add more NotificationItems as needed
        ],
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time;
  final Color color;

  const NotificationItem({
    required this.title,
    required this.subtitle,
    required this.time,
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      color: color.withOpacity(0.2),
      child: ListTile(
        title: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          subtitle,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        trailing: Text(
          time,
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ),
    );
  }
}
