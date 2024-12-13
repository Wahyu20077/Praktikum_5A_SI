import 'package:flutter/material.dart';

class Imaga04 extends StatelessWidget {
  const Imaga04({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menampilkan Gambar dari URL'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildImageCard('https://cdn.brilio.net/community/community-news/2017/09/30/1c4c28b4d8ee81bdf118ebccf6f54aea/29-image_1506692141_59ce4c2db7120.jpg',),
            buildImageCard('https://akcdn.detik.net.id/community/media/visual/2023/05/24/foto-ai-hewan-lucu-2.webp?w=750&q=90.jpeg',),
            buildImageCard('https://cdns.klimg.com/mav-prod-resized/480x/webp/feedImage/2024/6/15/1718420786288-tx2jl.jpeg',),
            buildImageCard('https://asset-a.grid.id/crop/0x0:0x0/700x0/photo/2021/05/06/kukangjpg-20210506030059.jpg',),
            buildImageCard('https://asset-a.grid.id//crop/0x0:0x0/700x465/photo/2019/10/28/3227634164.jpg',),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk membangun kotak gambar
  Widget buildImageCard(String imageUrl) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), // Sudut melengkung
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10), // Sudut melengkung untuk gambar
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover, // Memastikan gambar penuh di dalam kontainer
          height: 150.0, // Tinggi kontainer
          width: double.infinity, // Lebar penuh
          loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                    : null,
              ),
            );
          },
          errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
            return const Center(child: Text('Gagal memuat gambar'));
          },
        ),
      ),
    );
  }
}
