import 'package:flutter/material.dart';
import 'package:new_scanner/pages/profile.dart';
import 'package:new_scanner/pages/search.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'pages/clima.dart';
import 'pages/yourPlants.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  static const title = 'Your Plantas'; //define titulo inicial

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _currentIndex = 0; //index do icone clicado

  final List<Widget> screens = [YourPlants(), Clima(), Search(), Profile()];

  ///lista todas as telas

  Widget currentScreen = YourPlants();

  ///define tela atual

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentScreen,
      bottomNavigationBar: SalomonBottomBar(
        ///widget de bottom bar
        currentIndex: _currentIndex,

        /// define o index selecionado
        onTap: (i) => setState(() {
          _currentIndex = i;
          if (i < screens.length) {
            /// verifica se a quantidade de icones equivale a quantidade de páginas
            currentScreen = screens[i];

            ///define a tela de acordo com o icone
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
