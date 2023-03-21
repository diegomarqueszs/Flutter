import 'dart:io';

class PlantModel {
  String? plant_tile; //nome da planta
  String? plant_local; //local onde a coleta foi realizada
  int? plant_percent; //percentual de coleta para planta
  File? plant_image;

  PlantModel(
      {this.plant_image,
      this.plant_tile,
      this.plant_local,
      this.plant_percent});
}
