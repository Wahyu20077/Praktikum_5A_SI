import 'package:flutter/material.dart';
//import 'package:pertemuan2/Checkbox01.dart';
//import 'package:pertemuan2/Checkbox02.dart';
//import 'package:pertemuan2/Contohstatefullwidget.dart';
//import 'package:pertemuan2/Contohstateleswidget.dart';
//import 'package:pertemuan2/Studikasus01.dart';
import 'package:pertemuan2/Radiobutton01.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Belajar Widget',
      home: Radiobutton01(),
    );
  }
}