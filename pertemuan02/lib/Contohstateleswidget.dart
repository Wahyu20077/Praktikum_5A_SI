import 'package:flutter/material.dart';

class Contohstateleswidget extends StatelessWidget {
  Contohstateleswidget({super.key});
  
  final TextEditingController _controllerPesan = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stateles Widget'),),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          children: [
            TextField(
              controller: _controllerPesan,
              decoration: const InputDecoration(labelText: 'Masukkan Pesan Anda:'),
            ),
            Text(
              'Pesan: ${_controllerPesan.text}',
              )
          ],
        ),
      ),
    );
  }
}
