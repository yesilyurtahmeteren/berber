import 'package:flutter/material.dart';
import 'package:masal/pages/anasayfa.dart';
import 'package:masal/pages/giris_yap.dart';
import 'package:masal/pages/randevu.dart';
import 'package:masal/pages/profil.dart';

void main() {
  runApp(const BerberimApp());
}

class BerberimApp extends StatelessWidget {
  const BerberimApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Berberim',
      theme: ThemeData(
        primaryColor: const Color(0xFFE6F7FF),
        scaffoldBackgroundColor: const Color(0xFFE6F7FF),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF41A891),
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFFFFFFF),
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Color(0xFF4A4A4A),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          iconTheme: IconThemeData(color: Color(0xFF4A4A4A)),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xFFFFFFFF),
          selectedItemColor: Color(0xFF41A891),
          unselectedItemColor: Color(0xFF9B9B9B),
        ),
      ),
      home: const GirisYapPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    const AnasayfaPage(),
    const RandevuPage(),
    const ProfilPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Anasayfa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Randevu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
