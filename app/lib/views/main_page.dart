import 'package:app/views/account_page.dart';
import 'package:app/views/map_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Offstage(offstage: page != 0, child: MapPage()),
            Offstage(offstage: page != 1, child: AccountPage()),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: page,
        selectedItemColor: Colors.greenAccent[400],
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.map_outlined), label: "Map"),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: "Account",
          ),
        ],
        onTap:
            (value) => setState(() {
              page = value;
            }),
      ),
    );
  }
}
