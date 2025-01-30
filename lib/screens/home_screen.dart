import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../core/constants.dart';
import '../widgets/bottom_menu.dart';
import '../widgets/suggested_action_card.dart';
import '../main.dart'; 
import 'package:google_fonts/google_fonts.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkMode = themeProvider.themeMode == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'NEWSLY',
          style: TextStyle(
            color: Colors.white, 
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor:  Color.fromARGB(255, 81, 44, 113), 
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: const Color.fromARGB(255, 19, 19, 19), 
            height: 4.0,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? CupertinoIcons.sun_max_fill : CupertinoIcons.moon_fill),
            onPressed: () {
              themeProvider.toggleTheme();
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                child: Icon(
                  CupertinoIcons.person_solid,
                  size: 50,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
              accountName: const Text("Hoşgeldiniz"),
              accountEmail: null,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 81, 44, 113), 
              ),
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.news),
              title: const Text('Haberler'),
              onTap: () => context.go("/news"),
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.search),
              title: const Text('Arama'),
              onTap: () => context.push("/search"),
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.person),
              title: const Text('Profil'),
              onTap: () => context.push("/profile"),
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.settings),
              title: const Text('Ayarlar'),
              onTap: () => context.push("/settings"),
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.person),
              title: const Text('Kullanıcı'),
              onTap: () => context.push("/register"),
            ),
            const Spacer(),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Çıkış Yap'),
              onTap: () => context.go("/login"),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(24),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: DotLottieLoader.fromAsset(
                    "assets/motions/pODaS5ccbl.lottie",
                    frameBuilder: (context, dotlottie) {
                      if (dotlottie != null) {
                        return Lottie.memory(
                          dotlottie.animations.values.single,
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceVariant,
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
                ),
                child: ListView(
                  padding: const EdgeInsets.all(24),
                  children: [
                    SuggestedActionCard(
                      icon: Icons.article,
                      title: "Son Dakika Haberleri",
                      subtitle: "En güncel haberleri görüntüleyin",
                      onTap: () => context.push("/latest-news"),
                    ),
                    const SizedBox(height: 16),
                    SuggestedActionCard(
                      icon: Icons.trending_up,
                      title: "Popüler Haberler",
                      subtitle: "En çok okunan haberleri keşfedin",
                      onTap: () => context.push("/trending-news"),
                    ),
                    const SizedBox(height: 16),
                    SuggestedActionCard(
                      icon: Icons.category,
                      title: "Kategoriler",
                      subtitle: "İlginizi çeken haberleri keşfedin",
                      onTap: () => context.push("/categories"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomMenu(),
    );
  }
}
