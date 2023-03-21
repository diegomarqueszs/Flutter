import 'dart:io';

import 'package:flutter/material.dart';

import '../model/plant_model.dart';

class NovaPlantaScreen extends StatefulWidget {
  final File image;
  final List<PlantModel> plantsList;

  const NovaPlantaScreen(
      {Key? key, required this.image, required this.plantsList})
      : super(key: key);

  @override
  _NovaPlantaScreenState createState() => _NovaPlantaScreenState();
}

class _NovaPlantaScreenState extends State<NovaPlantaScreen> {
  // Variáveis para armazenar o título, local e porcentagem da nova planta
  String titulo = '';
  String local = '';
  int porcentagem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nova Planta'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Exibir a imagem selecionada pelo usuário
            Image.file(widget.image),

            // Formulário para preenchimento do título, local e porcentagem da nova planta
            TextFormField(
              decoration: InputDecoration(labelText: 'Título'),
              onChanged: (value) => titulo = value,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Local'),
              onChanged: (value) => local = value,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Porcentagem'),
              keyboardType: TextInputType.number,
              onChanged: (value) => porcentagem = int.tryParse(value) ?? 0,
            ),

            // Botão para adicionar a nova planta
            ElevatedButton(
              onPressed: () {
                // Criar a nova planta e adicioná-la à lista de plantas
                final novaPlanta = PlantModel(
                  plant_image: widget.image,
                  plant_tile: titulo,
                  plant_local: local,
                  plant_percent: porcentagem,
                );
                widget.plantsList.add(novaPlanta);

                // Voltar para a tela anterior
                Navigator.pop(context);
              },
              child: Text('Adicionar'),
            ),
          ],
        ),
      ),
    );
  }
}
