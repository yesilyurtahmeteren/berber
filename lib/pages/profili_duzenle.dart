import 'package:flutter/material.dart';

class ProfiliDuzenlePage extends StatefulWidget {
  const ProfiliDuzenlePage({Key? key}) : super(key: key);

  @override
  _ProfiliDuzenlePageState createState() => _ProfiliDuzenlePageState();
}

class _ProfiliDuzenlePageState extends State<ProfiliDuzenlePage> {
  final TextEditingController _isimController = TextEditingController(text: "Yusuf Eren");
  final TextEditingController _soyisimController = TextEditingController(text: "Nalbant");
  final TextEditingController _dogumTarihiController = TextEditingController(text: "21.12.2002");
  final TextEditingController _emailController = TextEditingController(text: "yusufnalbant@gmail.com");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE6F7FF),
      appBar: AppBar(
        title: const Text('Profili Düzenle'),
        backgroundColor: Colors.white, // AppBar Background Color
        elevation: 4, // Gölgelendirme için elevation artırıldı
        centerTitle: true, // Başlığı ortalama
        shadowColor: Colors.grey.withOpacity(0.5), // Gölgelendirme rengi
        titleTextStyle: const TextStyle(
          color: Colors.black, // Başlık metni rengi
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 20),
            _buildEditableTextField("İsim", _isimController),
            const SizedBox(height: 10),
            _buildEditableTextField("Soyisim", _soyisimController),
            const SizedBox(height: 10),
            _buildEditableTextField("Doğum Tarihi", _dogumTarihiController),
            const SizedBox(height: 10),
            _buildEditableTextField("E-mail", _emailController),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Bilgileri kaydetme işlemi
                  Navigator.pop(context); // Profil sayfasına dön
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFA7FFDF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  elevation: 5,
                  shadowColor: Colors.grey.withOpacity(0.5),
                ),
                child: const Text(
                  "Kaydet",
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEditableTextField(String labelText, TextEditingController controller) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          border: InputBorder.none,
          labelStyle: const TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
