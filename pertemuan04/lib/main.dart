import 'package:flutter/material.dart';
import 'gaji.dart'; // Pastikan file ini sesuai dengan lokasi file Pegawai

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Pegawai(), // Widget Pegawai dijalankan sebagai halaman utama
  ));
}
