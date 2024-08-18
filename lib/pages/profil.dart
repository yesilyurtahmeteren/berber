import 'package:flutter/material.dart';
import 'package:masal/pages/giris_yap.dart';
import 'package:masal/pages/profili_duzenle.dart'; // Profili Düzenle Sayfası import edilir

class ProfilPage extends StatefulWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  final TextEditingController _isimController = TextEditingController(text: "Yusuf Eren");
  final TextEditingController _soyisimController = TextEditingController(text: "Nalbant");
  final TextEditingController _dogumTarihiController = TextEditingController(text: "21.12.2002");
  final TextEditingController _emailController = TextEditingController(text: "yusufnalbant@gmail.com");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE6F7FF), // Light Blue Background
      appBar: AppBar(
        title: const Text('Profil'),
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
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Profil başlığı ve fotoğrafı
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 220,
                  decoration: BoxDecoration(
                    color: const Color(0xFFA7FFDF),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                ),
                const CircleAvatar(
                  radius: 80, // Profil fotoğrafını büyütüyoruz
                  backgroundImage: AssetImage('assets/user_profile.png'), // Profil resmi
                ),
                Positioned(
                  top: 160,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Profil fotoğrafını değiştirme işlevi
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: const BorderSide(color: Colors.grey),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      elevation: 0, // Buton gölgesini kaldırma
                    ),
                    icon: const Icon(Icons.camera_alt, color: Colors.grey),
                    label: const Text(
                      "Fotoğrafı Değiştir",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            // Profil bilgileri TextField formatında olacak
            _buildProfileTextField("İsim", _isimController),
            const SizedBox(height: 10),
            _buildProfileTextField("Soyisim", _soyisimController),
            const SizedBox(height: 10),
            _buildProfileTextField("Doğum Tarihi", _dogumTarihiController),
            const SizedBox(height: 10),
            _buildProfileTextField("E-mail", _emailController),
            const SizedBox(height: 20),
            // Profili düzenleme butonu
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfiliDuzenlePage()), // Yeni düzenleme sayfasına yönlendirme
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFA7FFDF), // Düzenleme Butonu Rengi
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                elevation: 5, // Butona gölge ekleme
                shadowColor: Colors.grey.withOpacity(0.5),
              ),
              child: const Text(
                "Profili Düzenle",
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            // Ayarlar ve çıkış yapma seçenekleri
            ElevatedButton.icon(
              onPressed: () {
                // Şifreyi değiştir işlevi
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black, backgroundColor: Colors.white,
                side: const BorderSide(color: Colors.grey),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                elevation: 5, // Butona gölge ekleme
                shadowColor: Colors.grey.withOpacity(0.5),
              ),
              icon: const Icon(Icons.lock, color: Colors.black),
              label: const Text(
                "Şifreyi Değiştir",
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {
                // Hesabı silme işlevi
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                elevation: 5, // Butona gölge ekleme
                shadowColor: Colors.grey.withOpacity(0.5),
              ),
              icon: const Icon(Icons.delete, color: Colors.white),
              label: const Text(
                "Hesabı Sil",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            // Çıkış yapma butonu
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const GirisYapPage()),
                  (Route<dynamic> route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                side: const BorderSide(color: Colors.red),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                elevation: 5, // Butona gölge ekleme
                shadowColor: Colors.grey.withOpacity(0.5),
              ),
              icon: const Icon(Icons.exit_to_app, color: Colors.red),
              label: const Text(
                "Çıkış Yap",
                style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileTextField(String labelText, TextEditingController controller) {
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
        readOnly: true, // Profil bilgilerinin sadece okunabilir olmasını sağla
      ),
    );
  }
}
