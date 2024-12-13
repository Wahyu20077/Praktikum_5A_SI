import 'package:flutter/material.dart';

class Checkbox01 extends StatefulWidget {
  const Checkbox01({super.key});

  @override
  State<Checkbox01> createState() => _Checkbox01State();
}

class _Checkbox01State extends State<Checkbox01> {
  bool _disChecked = false; // Menyimpan status checkbox

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contoh Checkbox 01')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Checkbox widget
            Checkbox(
              value: _disChecked,
              onChanged: (bool? value) {
                setState(() {
                  _disChecked = value ?? false; // Memperbaharui status checkbox
                });
              },
            ),
            // Menampilkan status checkbox
            Text(
              _disChecked ? 'Checkbox dipilih' : 'Checkbox tidak dipilih',
              style: TextStyle(fontSize: 20),
            ),
          ],
        )
      ),
    );
  }
}