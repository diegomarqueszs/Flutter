import 'dart:io';

import 'package:camera_camera/camera_camera.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

import '../model/details_plant.dart';
import '../model/plant_model.dart';
import 'novaPlantaScreen.dart';

class YourPlants extends StatefulWidget {
  const YourPlants({super.key});

  @override
  State<YourPlants> createState() => _YourPlantState();
}

class _YourPlantState extends State<YourPlants> {
  late File arquivo;

  static List<PlantModel> your_plants = [];

  List<PlantModel>? display_list = List.from(your_plants);

  void updateList(String value) {
    //buscar planta
    setState(() {
      display_list = your_plants
          .where((element) =>
              element.plant_tile!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  void openCamera() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => CameraCamera(
          onFile: (file) {
            // Navegar para a tela de preenchimento do título, local e porcentagem
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => NovaPlantaScreen(
                  image: file,
                  plantsList: your_plants,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDCEDC8),
      appBar: AppBar(
        backgroundColor: Color(0xFFDCEDC8),
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: openCamera,
        child: const Icon(Icons.add_a_photo),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "suas plantas",
              style: TextStyle(
                  color: Color(0xFF33691E),
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextField(
              onChanged: (value) => updateList(value),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                  hintText: ("Buscar planta"),
                  prefixIcon: Icon(Icons.search),
                  prefixIconColor: Colors.grey.shade900),
            ),
            SizedBox(
              height: 20.00,
            ),
            Expanded(
              child: display_list?.length == 0
                  ? Center(
                      child: Text(
                        "Nenhuma planta encontrada",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF33691E)),
                      ),
                    )
                  : ListView.builder(
                      padding: EdgeInsets.all(8.0),
                      itemCount: display_list?.length,
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.only(bottom: 15.0),
                        child: GestureDetector(
                          onTap: () {
                            if (display_list?[index] != null) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PlantDetailsPage(
                                    plant: display_list![index],
                                  ),
                                ),
                              );
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  width: 0.0, color: Colors.transparent),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: ListTile(
                              contentPadding: EdgeInsets.all(8.0),
                              title: Text(
                                display_list?[index].plant_tile ?? '',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              subtitle: Text(
                                  '${display_list?[index].plant_local ?? ''}'),
                              trailing: Text(
                                '${(display_list?[index].plant_percent ?? 0).toStringAsFixed(0)}%',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              leading: CircleAvatar(
                                radius: 25.0,
                                backgroundImage:
                                    display_list?[index].plant_image != null
                                        ? MemoryImage(
                                            display_list![index]
                                                .plant_image!
                                                .readAsBytesSync(),
                                          )
                                        : null,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
