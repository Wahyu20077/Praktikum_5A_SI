import 'package:flutter/material.dart';

class Radiobutton01 extends StatefulWidget {
  const Radiobutton01({super.key});

  @override
  _Radiobutton01State createState() => _Radiobutton01State();
}

class _Radiobutton01State extends State<Radiobutton01> {
  String? _selectedHobby; // Variabel untuk menyimpan pilihan hobi

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contoh RadioButton'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Pilih Hobi Anda:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            RadioListTile<String>(
              title: const Text('Bermain Musik'),
              value: 'Bermain Musik',
              groupValue: _selectedHobby,
              onChanged: (value) {
                setState(() {
                  _selectedHobby = value;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text('Olahraga'),
              value: 'Olahraga',
              groupValue: _selectedHobby,
              onChanged: (value) {
                setState(() {
                  _selectedHobby = value;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text('Membaca'),
              value: 'Membaca',
              groupValue: _selectedHobby,
              onChanged: (value) {
                setState(() {
                  _selectedHobby = value;
                });
              },
            ),
            const SizedBox(height: 20),
            Text(
              _selectedHobby != null
                  ? 'Hobi yang dipilih: $_selectedHobby'
                  : 'Belum ada hobi yang dipilih',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
