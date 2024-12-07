import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomMenu extends StatelessWidget {
  const BottomMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {
              context.go("/home");
            },
            icon: Icon(
              CupertinoIcons.home,
            ),
          ),
          IconButton(
            onPressed: () {
              context.go("/search");
            },
            icon: Icon(
              CupertinoIcons.search_circle_fill,
            ),
          ),
          IconButton(
            onPressed: () {
              context.go("/voice");
            },
            icon: Icon(
              Icons.voice_chat,
            ),
          ),
          IconButton(
            onPressed: () {
              context.go("/history");
            },
            icon: Icon(
              Icons.history_edu,
            ),
          ),
          IconButton(
            onPressed: () {
              context.go("/profile");
            },
            icon: Icon(
              CupertinoIcons.person_alt_circle,
            ),
          ),
        ],
      ),
    );
  }
}
