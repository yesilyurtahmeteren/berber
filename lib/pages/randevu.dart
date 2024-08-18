import 'package:flutter/material.dart';

class RandevuPage extends StatelessWidget {
  const RandevuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE6F7FF), // Light Blue Background
      appBar: AppBar(
        title: const Text('Randevu'),
        backgroundColor: Colors.white, // AppBar Background Color
        centerTitle: true, // Başlığı ortalar
        elevation: 4, // Gölgelendirme için elevation artırıldı
        shadowColor: Colors.grey.withOpacity(0.5), // Gölgelendirme rengi
        titleTextStyle: const TextStyle(
          color: Colors.black, // Başlık metni rengi
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Kullanıcı Dostu Randevu Kartı
            Card(
              elevation: 5,
              margin: const EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              shadowColor: Colors.grey.withOpacity(0.5),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.calendar_today, color: Colors.grey[700]),
                        const SizedBox(width: 10),
                        Text(
                          "14 Şubat 2024, 19:30",
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Divider(color: Colors.grey[300]),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.person, color: Colors.grey[700]),
                        const SizedBox(width: 10),
                        Text(
                          "Kuaför: Enes Muratlı",
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.cut, color: Colors.grey[700]),
                        const SizedBox(width: 10),
                        Text(
                          "Talep: Saç, Sakal",
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: () {
                          // Randevuyu onaylama işlemi
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFA7FFDF), // Onay Butonu Rengi
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                          elevation: 3,
                          shadowColor: Colors.grey.withOpacity(0.5),
                        ),
                        child: const Text(
                          "Onayla",
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
