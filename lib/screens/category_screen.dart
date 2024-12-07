import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants.dart';
import 'package:flutter_app/widgets/bottom_menu.dart';

class CategoryScreen extends StatelessWidget {

  final String categoryName;
  final Color categoryColor;
   // Constructor, kategori bilgilerini alıyor
  const CategoryScreen({
    Key? key,
    required this.categoryName,
    required this.categoryColor,
  }) : super(key: key);

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: categoryColor,
        title: Text(
          categoryName,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Kategori açıklaması
            Text(
              'Bu sayfada $categoryName ile ilgili haberleri keşfedin!',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),

            // Örnek haber kartları
            Expanded(
              child: ListView.builder(
                itemCount: 10, // Haber sayısı
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: const DecorationImage(
                            image: NetworkImage(
                              'https://via.placeholder.com/150', // Örnek resim
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      title: Text('$categoryName Haber Başlığı $index'),
                      subtitle: Text(
                        'Bu, $categoryName ile ilgili örnek bir haber açıklamasıdır.',
                      ),
                      onTap: () {
                        // Haber detay ekranına gitme (placeholder)
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('$categoryName haber $index seçildi!'),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
