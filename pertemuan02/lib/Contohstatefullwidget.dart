import 'package:flutter/material.dart';

class Contohstatefullwidget extends StatefulWidget {
  @override
  _ContohstatefullWidgetState createState() => _ContohstatefullWidgetState();
}

class _ContohstatefullWidgetState extends State<Contohstatefullwidget> {
  final TextEditingController _controller = TextEditingController();
  String _name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stateful Widget')),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(labelText: 'Masukkan Nama'),
              onChanged: (value) {
                setState(() {
                  _name = value;
                });
              },
            ),
            SizedBox(height: 20),
            Text(
              'Nama: $_name',
              style: const TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
