import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AnasayfaPage extends StatefulWidget {
  const AnasayfaPage({Key? key}) : super(key: key);

  @override
  _AnasayfaPageState createState() => _AnasayfaPageState();
}

class _AnasayfaPageState extends State<AnasayfaPage> {
  final List<Map<String, String>> _randevular = []; // Randevuları tutmak için liste

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE6F7FF), // Light Blue Background
      appBar: AppBar(
        title: const Text('Anasayfa'),
        backgroundColor: Colors.white, // AppBar Background Color
        centerTitle: true, // Başlığı ortalar
        elevation: 4, // Gölgelendirme için elevation artırıldı
        shadowColor: Colors.grey.withOpacity(0.5), // Gölgelendirme rengi
        titleTextStyle: const TextStyle(
          color: Colors.black, // Başlık metni rengi
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.black),
            onPressed: () {
              // Bildirimlere tıklama işlemi
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Center(
              child: Image(
                image: AssetImage('assets/berberim_logo.png'),
                height: 100,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Hoşgeldin, Ahmet",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF4A4A4A)), // Dark Gray Text
            ),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                hintText: 'Berber ara...',
                prefixIcon: Icon(Icons.search, color: Colors.black),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFA7FFDF), // Button Color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 5,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shadowColor: Colors.grey.withOpacity(0.5), // Gölgelendirme
                ),
                icon: const Icon(Icons.cut, color: Colors.black),
                label: const Text(
                  "Randevu Oluştur",
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  _showRandevuOlusturDialog(context); // Popup gösterme
                },
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: _randevular.isEmpty
                  ? const Center(
                      child: Text(
                        "Henüz bir randevunuz yok.",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      itemCount: _randevular.length,
                      itemBuilder: (context, index) {
                        final randevu = _randevular[index];
                        return Card(
                          elevation: 3,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            leading: const Icon(Icons.calendar_today, color: Colors.black),
                            title: Text(randevu['tarih']! + ", " + randevu['saat']!),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Kuaför: ${randevu['kuafor']}"),
                                Text("Talep: ${randevu['talep']}"),
                              ],
                            ),
                            trailing: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _randevular.removeAt(index); // Randevuyu listeden kaldırma
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              ),
                              child: const Text(
                                "İptal Et",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  void _showRandevuOlusturDialog(BuildContext context) {
    final TextEditingController _dateController = TextEditingController();
    final TextEditingController _timeController = TextEditingController();
    final TextEditingController _kuaforController = TextEditingController();
    final TextEditingController _talepController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Randevu Oluştur",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _dateController,
                  decoration: const InputDecoration(
                    labelText: "Tarih Seç",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.calendar_today, color: Colors.black),
                  ),
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                    );
                    if (pickedDate != null) {
                      String formattedDate = DateFormat('dd MMMM yyyy').format(pickedDate);
                      _dateController.text = formattedDate;
                    }
                  },
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _timeController,
                  decoration: const InputDecoration(
                    labelText: "Saat Seç",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.access_time, color: Colors.black),
                  ),
                  readOnly: true,
                  onTap: () async {
                    TimeOfDay? pickedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (pickedTime != null) {
                      final now = DateTime.now();
                      final dt = DateTime(now.year, now.month, now.day, pickedTime.hour, pickedTime.minute);
                      final format = DateFormat.jm(); // 'jm' to get AM/PM time format
                      _timeController.text = format.format(dt);
                    }
                  },
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _kuaforController,
                  decoration: const InputDecoration(
                    labelText: "Kuaför Seç",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person, color: Colors.black),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _talepController,
                  decoration: const InputDecoration(
                    labelText: "Talep (Saç, Sakal vb.)",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _randevular.add({
                          'tarih': _dateController.text,
                          'saat': _timeController.text,
                          'kuafor': _kuaforController.text,
                          'talep': _talepController.text,
                        });
                      });
                      Navigator.of(context).pop(); // Popup'ı kapatma
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
      },
    );
  }
}
