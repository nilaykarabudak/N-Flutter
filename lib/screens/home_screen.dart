import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MoodNews'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue, // Primary renk
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Ruh Haline Göre Haberler
              const Text(
                'Önerilen Haberler',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildNewsCard('Bilim ve Teknoloji', 'assets/images/bilim.jpg'),
                    _buildNewsCard('Sağlık Haberleri', 'assets/images/health.jpg'),
                    _buildNewsCard('Sanat ve Kültür', 'assets/images/art.jpg'),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Kategoriler
              const Text(
                'Kategoriler',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _buildCategoryCard('Mavi', Colors.blue),
                  _buildCategoryCard('Kırmızı', Colors.red),
                  _buildCategoryCard('Sarı', Colors.yellow),
                  _buildCategoryCard('Yeşil', Colors.green),
                ],
              ),
              const SizedBox(height: 20),

              // Öne Çıkan Haberler
              const Text(
                'Öne Çıkan Haberler',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Column(
                children: [
                  _buildFeaturedNews(
                      'NASA\'dan Yeni Keşif', 'Uzay hakkında çığır açan yeni bilgiler.', 'assets/images/space.jpg'),
                  const SizedBox(height: 10),
                  _buildFeaturedNews(
                      'Ekonomi Yükseliyor', 'Borsa yeni rekorlar kırdı.', 'assets/images/economy.jpg'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Haber Kartları
  Widget _buildNewsCard(String title, String imagePath) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: 150,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(imagePath, height: 120, width: 150, fit: BoxFit.cover),
          ),
          const SizedBox(height: 5),
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  // Kategori Kartları
  Widget _buildCategoryCard(String title, Color color) {
    return GestureDetector(
      onTap: () {
        // Kategoriye gitme işlemi
      },
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.8),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  // Öne Çıkan Haber Kartları
  Widget _buildFeaturedNews(String title, String description, String imagePath) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(imagePath, height: 80, width: 80, fit: BoxFit.cover),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
                Text(description, style: const TextStyle(fontSize: 14, color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
