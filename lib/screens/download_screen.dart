import 'package:flutter/material.dart';

class DownloadScreen extends StatelessWidget {
  const DownloadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icon/tabii_icon.png',
                width: 150,
                height: 150,
              ),
              const SizedBox(height: 16),
              const Text(
                'İçerik indirebilmek için paketini yükselt.',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              const Text(
                'Mevcut paketin çevrimdışı izlemeye uygun değil. Paketini yükseltmek, sevdiğin içerikleri indirip internetin yokken de izleyebilirsin.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  // Paketleri inceleme ekranına yönlendirme kodunu ekle
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF00FF99),
                  padding: EdgeInsets.symmetric(vertical: 5),
                  textStyle: TextStyle(fontSize: 16),
                  minimumSize: Size(double.infinity, 50),
                ).copyWith(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                child: Text(
                  "Paketleri İncele",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
