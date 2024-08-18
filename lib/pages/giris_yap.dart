import 'package:flutter/material.dart';
import 'package:masal/main.dart'; // MainPage'i import edin
import 'package:masal/pages/kayit_ol.dart'; // KayitOlPage'i import edin

class GirisYapPage extends StatelessWidget {
  const GirisYapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFA293FF),
              Color(0xFFFFFFFF),
            ],
          ),
        ),
        child: Center( 
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Spacer(flex: 2),
              // Logo ile hafif büyüme animasyonu
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut,
                  child: Image.asset(
                    'assets/berberim_logo.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              // Giriş Yap Başlığı
              const Text(
                "Giriş Yap",
                style: TextStyle(
                  fontSize: 24, 
                  fontWeight: FontWeight.bold, 
                  color: Colors.black,
                  shadows: [
                    Shadow(
                      blurRadius: 5.0,
                      color: Colors.grey,
                      offset: Offset(3.0, 3.0),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Kullanıcı Adı TextField ile hafif gölge efekti
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Kullanıcı Adı',
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // Şifre TextField ile hafif gölge efekti
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Şifre',
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  ),
                  obscureText: true,
                ),
              ),
              const SizedBox(height: 20),
              // Giriş Yap Butonu için büyüme animasyonu
              GestureDetector(
                onTapDown: (_) => _onTapDown(context),
                onTapUp: (_) => _onTapUp(context),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 100),
                  transform: Matrix4.identity()..scale(1.05),
                  curve: Curves.easeInOut,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFA7FFDF), 
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                      elevation: 5, // Hafif gölge efekti
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const MainPage()), 
                      );
                    },
                    child: const Text(
                      "Giriş Yap",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            blurRadius: 2.0,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Ya da",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              const SizedBox(height: 20),
              // Google ile Giriş Yap Butonu
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: const BorderSide(color: Colors.black),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  elevation: 3, // Hafif gölge efekti
                ),
                onPressed: () {
                  // Google ile giriş işlemi
                },
                icon: Image.asset('assets/google_logo.png', height: 24),
                label: const Text("Google ile giriş yap"),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Hesabınız yok mu?",
                    style: TextStyle(color: Colors.black),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const KayitOlPage()), 
                      );
                    },
                    child: const Text(
                      "Hesap Oluştur",
                      style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }

  void _onTapDown(BuildContext context) {
    // Animasyon başlangıcı
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }

  void _onTapUp(BuildContext context) {
    // Animasyon bitişi
  }
}
