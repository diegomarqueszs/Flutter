import 'package:flutter/material.dart';
import 'package:flutter_create_scannerplant/page/model/plant_model.dart';
import 'package:flutter_create_scannerplant/page/searchPlant.dart';

import 'model/details_plant.dart';

class YourPlant extends StatefulWidget {
  @override
  State<YourPlant> createState() => _YourPlantState();
}

class _YourPlantState extends State<YourPlant> {
  static List<PlantModel> your_plants = [
    PlantModel('Café', 'Lavras - MG', 60,
        'https://www.centraldasplantas.com.br/site/wp-content/uploads/2020/07/Cafe-Catuai-640x450.jpg'),
    PlantModel('Cana de açucar', 'Formiga - MG', 70,
        'https://nutricaodesafras.com.br/wp-content/uploads/2022/03/canadeacucar.jpg'),
    PlantModel('Trigo', 'Perdões - MG', 75,
        'https://www.infoescola.com/wp-content/uploads/2010/12/trigo_116527159.jpg'),
  ];

  List<PlantModel> display_list = List.from(your_plants);

  void updateList(String value) {
    //buscar planta
    setState(() {
      display_list = your_plants
          .where((element) =>
              element.plant_tile!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDCEDC8),
      appBar: AppBar(
        backgroundColor: Color(0xFFDCEDC8),
        elevation: 0.0,
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
              child: display_list.length == 0
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
                      itemCount: display_list.length,
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.only(bottom: 15.0),
                        child: GestureDetector(
                          onTap: () {
                            if (display_list[index] != null) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PlantDetailsPage(
                                    plant: display_list[index],
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
                                display_list[index].plant_tile!,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              subtitle:
                                  Text('${display_list[index].plant_local!}'),
                              trailing: Text(
                                '${(display_list[index].plant_percent!).toStringAsFixed(0)}%',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              leading: CircleAvatar(
                                radius: 25.0,
                                backgroundImage: NetworkImage(
                                    display_list[index].plant_image!),
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
