import 'package:flutter/material.dart';

class StudiKasus03 extends StatefulWidget {
  const StudiKasus03({super.key});

  @override
  StudiKasus03State createState() => StudiKasus03State(); // Harus sesuai dengan nama kelas State
}

class StudiKasus03State extends State<StudiKasus03> { // Perbaiki nama kelas State
  String? selectedGambar; // Menyimpan pilihan Gambar
  String? imageUrl; // URL gambar

  // Daftar Gambar dan URL gambar terkait
  final Map<String, String> gambarImages = {
    'Gambar 1': 'https://cdn.brilio.net/community/community-news/2017/09/30/1c4c28b4d8ee81bdf118ebccf6f54aea/29-image_1506692141_59ce4c2db7120.jpg',
    'Gambar 2': 'https://akcdn.detik.net.id/community/media/visual/2023/05/24/foto-ai-hewan-lucu-2.webp?w=750&q=90.jpeg',
    'Gambar 3': 'https://cdns.klimg.com/mav-prod-resized/480x/webp/feedImage/2024/6/15/1718420786288-tx2jl.jpeg',
    'Gambar 4': 'https://asset-a.grid.id/crop/0x0:0x0/700x0/photo/2021/05/06/kukangjpg-20210506030059.jpg',
    'Gambar 5': 'https://asset-a.grid.id//crop/0x0:0x0/700x465/photo/2019/10/28/3227634164.jpg',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Studi Kasus Combobox dan Gambar'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Dropdown untuk memilih Gambar
            DropdownButton<String>(
              hint: const Text('Pilih Gambar'),
              value: selectedGambar,
              onChanged: (String? value) {
                setState(() {
                  selectedGambar = value; // Set Gambar yang dipilih
                });
              },
              items: gambarImages.keys.map<DropdownMenuItem<String>>((String gambar) {
                return DropdownMenuItem<String>(
                  value: gambar,
                  child: Text(gambar),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            // Tombol untuk memuat gambar
            ElevatedButton(
              onPressed: () {
                setState(() {
                  imageUrl = gambarImages[selectedGambar]; // Ambil URL gambar
                });
              },
              child: const Text('Tampilkan Gambar'),
            ),
            const SizedBox(height: 20),
            // Menampilkan gambar jika ada URL yang valid
            imageUrl != null
                ? Image.network(
                    imageUrl!,
                    height: 200,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  (loadingProgress.expectedTotalBytes ?? 1)
                              : null,
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return const Text('Gagal memuat gambar');
                    },
                  )
                : const Text('Pilih gambar untuk menampilkan gambar'),
          ],
        ),
      ),
    );
  }
}
