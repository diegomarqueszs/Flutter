import 'package:flutter/material.dart';

class Config extends StatefulWidget {
  const Config({super.key});

  @override
  State<Config> createState() => _Config();
}

class _Config extends State<Config> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Configurações',
        ),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Text('Configurações', style: TextStyle(fontSize: 40)),
      ),
    );
  }
}
