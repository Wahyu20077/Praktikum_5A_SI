import 'package:flutter/material.dart';
//import 'package:pertemuan01/kolom.dart';
//import 'package:pertemuan01/Baris.dart';
//import 'package:pertemuan01/kotak.dart';
import 'package:pertemuan_01/studikasus01.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pertemuan 01',
      home: Studikasus01(),
    );
  }
}
