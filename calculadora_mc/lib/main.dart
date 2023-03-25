import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  String _infoText = "Informe seus dados";
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _calculate() {
    setState(() {
      double weigth = double.parse(weightController.text);
      double heigth = double.parse(heightController.text) / 100;
      double imc = weigth / (heigth * heigth);
      print(imc);
      if (imc < 18.6) {
        _infoText = "Abaixo do peso (${imc.toStringAsPrecision(3)} kg)";
      } else if (imc >= 18.6 && imc < 24.9) {
        _infoText = "Peso Ideal (${imc.toStringAsPrecision(3)} kg)";
      } else if (imc >= 24.9 && imc < 24.9) {
        _infoText =
            "Levemente Acima do Peso (${imc.toStringAsPrecision(3)} kg)";
      } else if (imc >= 29.9 && imc < 24.9) {
        _infoText = "Obesidade Grau I (${imc.toStringAsPrecision(3)} kg)";
      } else if (imc >= 34.9 && imc < 24.9) {
        _infoText = "Obesidade Grau II (${imc.toStringAsPrecision(3)} kg)";
      } else if (imc >= 40) {
        _infoText = "Obesidade Grau III (${imc.toStringAsPrecision(3)} kg)";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Calculadora IMC'),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                heightController.clear();
                weightController.clear();
                _infoText = "Informe seus dados";
                _formKey = GlobalKey<FormState>();
              });
            },
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(
                Icons.person_outline,
                color: Colors.green,
                size: 120,
              ),
              TextFormField(
                controller: weightController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Insira sua altura";
                  }
                },
                decoration: const InputDecoration(
                  labelText: 'Peso (kg)',
                  labelStyle: TextStyle(color: Colors.green),
                ),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.green, fontSize: 25),
              ),
              TextFormField(
                controller: heightController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Insira seu peso";
                  }
                },
                decoration: const InputDecoration(
                  labelText: 'Altura (cm)',
                  labelStyle: TextStyle(color: Colors.green),
                ),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.green, fontSize: 25),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50.0,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _calculate();
                    }
                  },
                  child: const Text(
                    'Calcular',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                _infoText,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.green,
                  fontSize: 20,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
