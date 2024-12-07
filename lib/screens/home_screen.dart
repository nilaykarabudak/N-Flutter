
import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/core/constants.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Newsly'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue, // Primary renk
        actions: [
          IconButton(icon: const Icon(CupertinoIcons.bell),
          onPressed: (){})
        ],
      ),

  // Drawer (Yan Menü)
      drawer: Drawer(
        backgroundColor: arkaplanRenkim,
        elevation: 0,
        child: Column(
          children: [
            // Drawer Header
            Container(
              height: 200,
              // color: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    CupertinoIcons.person_circle,
                    size: 80,
                    color: Colors.black87,
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            // Menü öğeleri
            ListTile(
              leading: const Icon(CupertinoIcons.home),
              title: const Text('Ana Sayfa'),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(CupertinoIcons.search),
              title: const Text('History'),
              onTap: () {
                context.go("/history");
              },
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.person),
              title: const Text('Profile'),
              onTap: () {
                context.go("/profile");
              },
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.settings),
              title: const Text('Ayarlar'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
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
                  _buildCategoryCard(context,'Mavi', Colors.blue),
                  _buildCategoryCard(context,'Kırmızı', Colors.red),
                  _buildCategoryCard(context,'Sarı', Colors.yellow),
                  _buildCategoryCard(context,'Yeşil', Colors.green),
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
  Widget _buildCategoryCard(BuildContext context,String title, Color color) {
    return GestureDetector(
      onTap: () {
        // Kategoriye gitme işlemi
        context.go(
        '/category',
        extra: {
          'categoryName': title,
          'categoryColor': color,
        },
      );
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
