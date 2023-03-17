import 'package:flutter/material.dart';

class SearchPlant extends StatefulWidget {
  const SearchPlant({super.key});

  @override
  State<SearchPlant> createState() => _SearchPlantState();
}

class _SearchPlantState extends State<SearchPlant> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDCEDC8),
      appBar: AppBar(
        backgroundColor: Color(0xFFDCEDC8),
        elevation: 0.0,
      ),
      body: Center(
        child: Text(
          'Search Plant',
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
