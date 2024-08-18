import 'package:flutter/material.dart';
import 'giris_yap.dart';

class KayitOlPage extends StatefulWidget {
  const KayitOlPage({super.key});

  @override
  _KayitOlPageState createState() => _KayitOlPageState();
}

class _KayitOlPageState extends State<KayitOlPage> {
  bool _kvkkChecked = false;

  void _showKvkkPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("KVKK Metni"),
          content: SingleChildScrollView(
            child: Text(
              "Bu uygulamayı kullanarak, kişisel verilerinizin korunması ve işlenmesi ile ilgili aşağıdaki bilgilendirme metnini kabul etmiş olursunuz:\n\n"
              "1. Kabul ve Onay\n"
              "Bu uygulamayı kullanarak, aşağıdaki kullanım koşullarını kabul ettiğinizi onaylıyorsunuz. Bu koşulları kabul etmiyorsanız, lütfen uygulamayı kullanmayınız.\n\n"
              "2. Uygulama Kullanımı\n"
              "Uygulama, sadece kişisel ve yasal amaçlarla kullanılmalıdır. Uygulamayı yasa dışı, zararlı veya izinsiz amaçlarla kullanmayacağınızı kabul edersiniz.\n\n"
              "3. Gizlilik Politikası\n"
              "Topladığımız bilgiler: Uygulamayı kullanırken sizden bazı kişisel bilgiler (ad, e-posta, profil fotoğrafı) ve kullanım verileri toplayabiliriz. Bu bilgileri uygulamayı geliştirmek için kullanırız.\n\n"
              "Bilgilerin Paylaşımı: Kişisel bilgilerinizi üçüncü taraflarla paylaşmayız, ancak yasal zorunluluklar veya uygulamanın güvenliğini sağlamak için gerekli durumlarda paylaşmamız gerekebilir.\n\n"
              "Çerezler: Uygulamayı kullanırken çerezler kullanılabilir. Çerezler, kullanıcı deneyiminizi geliştirmek için kullanılır.",
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                "Kabul Et",
                style: TextStyle(color: Color(0xFF7B3F61)), // KVKK yazısı için renk
              ),
              onPressed: () {
                setState(() {
                  _kvkkChecked = true;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFA293FF), // #A293FF
              Color(0xFFFFFFFF), // #FFFFFF
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0), // Kenarlardan sığdırma için padding ayarlandı
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 60),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Image.asset(
                    'assets/berberim_logo.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  "Kayıt Ol",
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
                _buildTextField(labelText: 'Ad'),
                const SizedBox(height: 10),
                _buildTextField(labelText: 'Soyad'),
                const SizedBox(height: 10),
                _buildTextField(labelText: 'E-mail'),
                const SizedBox(height: 10),
                _buildTextField(labelText: 'Şifre', obscureText: true),
                const SizedBox(height: 10),
                _buildTextField(labelText: 'Şifreyi yeniden girin', obscureText: true),
                const SizedBox(height: 10),
                _buildTextField(labelText: 'Doğum Tarihi'),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Checkbox(
                      value: _kvkkChecked,
                      onChanged: (bool? value) {
                        _showKvkkPopup();
                      },
                    ),
                    GestureDetector(
                      onTap: _showKvkkPopup,
                      child: const Text(
                        "KVKK",
                        style: TextStyle(
                          color: Color(0xFF7B3F61), // KVKK yazısı için renk
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
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
                      onPressed: _kvkkChecked
                          ? () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const MailDogrulamaPage()),
                              );
                            }
                          : null, // KVKK kabul edilmezse buton çalışmaz
                      child: const Text(
                        "Kayıt Ol",
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Hesabınız var mı?",
                      style: TextStyle(color: Colors.black),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Giriş Yap",
                        style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({required String labelText, bool obscureText = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0), // Kenarlardan sığdırmak için padding optimize edildi
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3), // Shadow position
            ),
          ],
        ),
        child: TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            labelText: labelText,
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: const BorderRadius.all(Radius.circular(30)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.purple, width: 2.0),
              borderRadius: const BorderRadius.all(Radius.circular(30)),
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          ),
          obscureText: obscureText,
        ),
      ),
    );
  }

  void _onTapDown(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }

  void _onTapUp(BuildContext context) {}
}

class MailDogrulamaPage extends StatelessWidget {
  const MailDogrulamaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFA293FF), // #A293FF
              Color(0xFFFFFFFF), // #FFFFFF
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/berberim_logo.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
              const SizedBox(height: 30),
              Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 100.0,
              ),
              const SizedBox(height: 20),
              const Text(
                "Kayıt Başarılı :)",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              const SizedBox(height: 10),
              const Text(
                "Lütfen Mail Adresinizi Doğrulayınız!",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFA7FFDF),
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const GirisYapPage()),
                    (Route<dynamic> route) => false,
                  );
                },
                child: const Text(
                  "Devam Et",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
