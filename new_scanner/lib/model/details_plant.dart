import 'package:flutter/material.dart';
import 'plant_model.dart';

class PlantDetailsPage extends StatelessWidget {
  final PlantModel plant;

  const PlantDetailsPage({Key? key, required this.plant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDCEDC8),
      appBar: AppBar(
        backgroundColor: Color(0xFF33691E),
        title: Text("Exibindo detalhes - ${plant.plant_tile}"),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(16.0),
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.0),
              Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: FileImage(plant.plant_image!),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Text.rich(
                TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Nome da planta: ',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF33691E),
                      ),
                    ),
                    TextSpan(
                      text: '${plant.plant_tile}',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: '\n\nLocalização da planta: ',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF33691E),
                      ),
                    ),
                    TextSpan(
                      text: '${plant.plant_local}',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: '\n\nPercentual para colheita: ',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF33691E),
                      ),
                    ),
                    TextSpan(
                      text: '${plant.plant_percent}%',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
