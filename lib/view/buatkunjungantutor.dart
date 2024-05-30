import 'package:flutter/material.dart';
import 'package:pantau_pro/dashboard/kunjungan.dart';

void main() {
  runApp(kunjungantutorAPP());
}

class kunjungantutorAPP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyImageSlider(),
    );
  }
}

class MyImageSlider extends StatefulWidget {
  @override
  _MyImageSliderState createState() => _MyImageSliderState();
}

class _MyImageSliderState extends State<MyImageSlider> {
  int currentPage = 0;

  final List<String> images = [
    "Asset/image/a.png",
    "Asset/image/b.png", // Ganti dengan gambar yang berbeda jika perlu
    "Asset/image/c.png",
    "Asset/image/d.png", // Ganti dengan gambar yang berbeda jika perlu
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'Asset/image/putih1.png', // Path to your logo image
          height: 40, // Adjust the height as needed
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.lightBlueAccent, Colors.blue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.white, // Set transparansi di sini
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: images.length,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return InteractiveViewer(
                    boundaryMargin: EdgeInsets.all(20.0),
                    minScale: 0.1,
                    maxScale: 4.0,
                    child: Image.asset(
                      images[index],
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fitWidth,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (currentPage ==
                    images.length - 1) // Check if it's the last page
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white
                          .withOpacity(0.7), // Set transparansi di sini
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const KunjunganPage(),
                          ),
                        );
                      },
                      icon: Icon(Icons.arrow_forward),
                      label: Text('Lanjut Ke Halaman Buat Kunjungan'),
                    ),
                  ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              'Page ${currentPage + 1} of ${images.length}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
