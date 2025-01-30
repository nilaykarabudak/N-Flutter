import 'package:flutter/material.dart';

import '../core/constants.dart';
import '../widgets/bottom_menu.dart';

class VoiceScreen extends StatelessWidget {
  const VoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  const Color.fromARGB(255, 255, 249, 252), 

      body: Center(
        child: Text("ses ekranim"),
      ),
      bottomNavigationBar: BottomMenu(),
    );
  }
}
