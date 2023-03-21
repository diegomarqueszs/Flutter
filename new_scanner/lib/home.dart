import 'package:flutter/material.dart';
import 'package:new_scanner/pages/profile.dart';
import 'package:new_scanner/pages/search.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'pages/clima.dart';
import 'pages/yourPlants.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  static const title = 'Your Plantas';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _currentIndex = 0;

  final PageStorageBucket bucket = PageStorageBucket();
  final List<Widget> screens = [YourPlants(), Clima(), Search(), Profile()];

  Widget currentScreen = YourPlants();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() {
          _currentIndex = i;
          if (i < screens.length) {
            currentScreen = screens[i];
            print(_currentIndex);
          } else {
            print("Index não cadastrado");
          }
        }),
        items: [
          /// Plantas
          SalomonBottomBarItem(
            icon: const Icon(Icons.local_florist),
            title: const Text("Plantas"),
            selectedColor: Colors.green,
          ),

          /// Clima
          SalomonBottomBarItem(
            icon: const Icon(Icons.cloudy_snowing),
            title: const Text("Clima"),
            selectedColor: const Color.fromARGB(255, 19, 12, 224),
          ),

          /// Search
          SalomonBottomBarItem(
            icon: const Icon(Icons.search),
            title: const Text("Search"),
            selectedColor: Colors.orange,
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: const Icon(Icons.person),
            title: const Text("Profile"),
            selectedColor: Colors.teal,
          ),
        ],
      ),
    );
  }
}
