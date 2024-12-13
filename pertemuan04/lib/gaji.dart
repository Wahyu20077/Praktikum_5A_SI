import 'package:flutter/material.dart';

class Pegawai extends StatefulWidget {
  const Pegawai({super.key});

  @override
  State<Pegawai> createState() => _PegawaiState();
}

class _PegawaiState extends State<Pegawai> {
  String? _nip;
  String? _nama;
  String? _pilihanGolongan;
  String? _pilihanStatus;
  int _masaKerja = 0;

  final TextEditingController nipController = TextEditingController();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController masaKerjaController = TextEditingController();

  final List<String> golongan = ['I', 'II', 'III', 'IV'];
  final List<String> status = ['Menikah', 'Belum Menikah'];

  int _tunjanganGapok(String? golongan) {
    switch (golongan) {
      case 'I':
        return 2500000;
      case 'II':
        return 3000000;
      case 'III':
        return 3500000;
      case 'IV':
        return 4000000;
      default:
        return 0;
    }
  }

  int _tunjanganStatus(String? status) {
    return (status == 'Menikah') ? 1000000 : 500000;
  }

  int _hitungTotalGaji(String? golongan, String? status, int masaKerja) {
    return _tunjanganGapok(golongan) + _tunjanganStatus(status) + (masaKerja * 200000);
  }

  void _navigateToResult(BuildContext context) {
    if (_pilihanGolongan == null || _pilihanStatus == null || _nip == null || _nama == null || _masaKerja <= 0) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Peringatan"),
          content: const Text("Harap lengkapi semua data dengan benar!"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK"),
            ),
          ],
        ),
      );
    } else {
      int totalGaji = _hitungTotalGaji(_pilihanGolongan, _pilihanStatus, _masaKerja);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HasilGaji(
            nip: _nip!,
            nama: _nama!,
            golongan: _pilihanGolongan!,
            status: _pilihanStatus!,
            masaKerja: _masaKerja,
            totalGaji: totalGaji,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gaji Pegawai'),
        backgroundColor: Colors.lightGreen,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: nipController,
              decoration: const InputDecoration(labelText: 'NIP Pegawai'),
              onChanged: (value) => setState(() => _nip = value),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: namaController,
              decoration: const InputDecoration(labelText: 'Nama Pegawai'),
              onChanged: (value) => setState(() => _nama = value),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: masaKerjaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Masa Kerja (tahun)'),
              onChanged: (value) => setState(() => _masaKerja = int.tryParse(value) ?? 0),
            ),
            const SizedBox(height: 12),
            DropdownButton<String>(
              hint: const Text('Golongan Pegawai'),
              value: _pilihanGolongan,
              onChanged: (value) => setState(() => _pilihanGolongan = value),
              isExpanded: true,
              items: golongan.map<DropdownMenuItem<String>>((String isi) {
                return DropdownMenuItem<String>(
                  value: isi,
                  child: Text(isi),
                );
              }).toList(),
            ),
            const SizedBox(height: 12),
            DropdownButton<String>(
              hint: const Text('Status Pegawai'),
              value: _pilihanStatus,
              onChanged: (value) => setState(() => _pilihanStatus = value),
              isExpanded: true,
              items: status.map<DropdownMenuItem<String>>((String isi) {
                return DropdownMenuItem<String>(
                  value: isi,
                  child: Text(isi),
                );
              }).toList(),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => _navigateToResult(context),
              child: const Text('Hitung Gaji'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                textStyle: const TextStyle(fontSize: 16),
                minimumSize: Size(double.infinity, 0), // Full width button
                backgroundColor: Colors.lightGreen,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HasilGaji extends StatelessWidget {
  final String nip;
  final String nama;
  final String golongan;
  final String status;
  final int masaKerja;
  final int totalGaji;

  const HasilGaji({
    super.key,
    required this.nip,
    required this.nama,
    required this.golongan,
    required this.status,
    required this.masaKerja,
    required this.totalGaji,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hasil Perhitungan Gaji'),
        backgroundColor: Colors.lightGreen,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('NIP: $nip', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            const SizedBox(height: 8),
            Text('Nama: $nama', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            const SizedBox(height: 8),
            Text('Golongan: $golongan', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            const SizedBox(height: 8),
            Text('Status: $status', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            const SizedBox(height: 8),
            Text('Masa Kerja: $masaKerja tahun', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            const SizedBox(height: 8),
            Text('Total Gaji: Rp $totalGaji', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}