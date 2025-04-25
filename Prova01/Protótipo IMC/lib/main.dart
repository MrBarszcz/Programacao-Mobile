// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

void main() {
  runApp(CalculadoraIMCApp());
}

class CalculadoraIMCApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora IMC',
      debugShowCheckedModeBanner: false,
      home: CalculadoraIMC(),
    );
  }
}

class CalculadoraIMC extends StatefulWidget {
  @override
  State<CalculadoraIMC> createState() => _CalculadoraIMCState();
}

class _CalculadoraIMCState extends State<CalculadoraIMC> {
  final pesoController = TextEditingController();
  final alturaController = TextEditingController();

  double? imc;
  double? zImc;
  String? classificacaoImc;
  String? classificacaoZImc;

  String tipo = "Adulto";
  String sexo = "Masculino";

  int idadeAnos = 0;
  int idadeMeses = 0;

  void calcularIMC() {
    double? peso = double.tryParse(pesoController.text);
    double? altura = double.tryParse(alturaController.text);
    final idadeEmMeses = idadeAnos * 12 + idadeMeses;

    if (altura != null && altura > 3) altura = altura / 100;
    if (peso != null && peso > 1000) peso = peso / 1000;

    if (peso != null && altura != null && altura > 0) {
      imc = peso / (altura * altura);
      setState(() {
        if (tipo == "Criança") {
          zImc = calcularZImc(idadeEmMeses, sexo, imc!);
          classificacaoZImc = classificarZImc(zImc!, idadeEmMeses);
        } else {
          classificacaoImc = classificarIMC(imc!);
          zImc = null;
        }
      });
    } else {
      setState(() {
        imc = null;
        zImc = null;
      });
    }
  }

  double calcularZImc(int meses, String sexo, double imc) {
    double m = 0.0;
    double sd = 0.0;

    if (sexo == "Masculino") {
      if (meses == 0) {
        m = 13.4;
        sd = 14.8 - m;
      } else if (meses == 1) {
        m = 14.9;
        sd = 16.3 - m;
      } else if (meses == 2) {
        m = 16.3;
        sd = 17.8 - m;
      } else if (meses == 3 || meses == 11) {
        m = 16.9;
        sd = 18.4 - m;
      } else if (meses == 4) {
        m = 17.2;
        sd = 18.7 - m;
      } else if (meses == 5 || meses == 6 || meses == 7) {
        m = 17.3;
        sd = 18.8 - m;
      } else if (meses == 8) {
        m = 17.3;
        sd = 18.7 - m;
      } else if (meses == 9) {
        m = 17.2;
        sd = 18.6 - m;
      } else if (meses == 10) {
        m = 17.0;
        sd = 18.5 - m;
      } else if (meses == 12) {
        m = 16.8;
        sd = 18.2 - m;
      } else if (meses == 13) {
        m = 16.7;
        sd = 18.1 - m;
      } else if (meses == 14) {
        m = 16.6;
        sd = 18.0 - m;
      } else if (meses == 15) {
        m = 16.4;
        sd = 17.8 - m;
      } else if (meses == 16) {
        m = 16.3;
        sd = 17.7 - m;
      } else if (meses == 17) {
        m = 16.2;
        sd = 17.6 - m;
      } else if (meses == 18) {
        m = 16.1;
        sd = 17.5 - m;
      } else if (meses == 19) {
        m = 16.1;
        sd = 17.4 - m;
      } else if (meses == 20 || meses == 25) {
        m = 16.0;
        sd = 17.3 - m;
      } else if (meses == 21 || meses == 27 || meses == 28) {
        m = 15.9;
        sd = 17.2 - m;
      } else if (meses == 22) {
        m = 15.8;
        sd = 17.2 - m;
      } else if (meses == 23 || meses == 29 || meses == 30 || meses == 31) {
        m = 15.8;
        sd = 17.1 - m;
      } else if (meses == 24 || meses == 32 || meses == 33 || meses == 34) {
        m = 15.7;
        sd = 17.0 - m;
      } else if (meses == 26) {
        m = 15.9;
        sd = 17.3 - m;
      } else if (meses == 35 || meses == 36 || meses == 37) {
        m = 15.6;
        sd = 16.9 - m;
      } else if (meses == 38 || meses == 39 || meses == 40 || meses == 41) {
        m = 15.5;
        sd = 16.8 - m;
      } else if (meses == 42) {
        m = 15.4;
        sd = 16.8 - m;
      } else if (meses == 43 || meses == 44 || meses == 45 || meses == 46) {
        m = 15.4;
        sd = 16.7 - m;
      } else if (meses == 47 || meses == 48 || meses == 49 || meses == 50) {
        m = 15.3;
        sd = 16.7 - m;
      } else if (meses == 51 || meses == 52 || meses == 53 || meses == 54) {
        m = 15.3;
        sd = 16.6 - m;
      } else if (meses == 55 || meses == 56 || meses == 57 || meses == 58 || meses == 59 || meses == 60) {
        m = 15.2;
        sd = 16.6 - m;
      } else if (meses == 72) { // 6 anos
        m = 15.3;
        sd = 16.8 - m;
      } else if (meses == 84) { // 7 anos
        m = 15.5;
        sd = 17.0 - m;
      } else if (meses == 96) { // 8 anos
        m = 15.7;
        sd = 17.4 - m;
      } else if (meses == 108) { // 9 anos
        m = 16.0;
        sd = 17.9 - m;
      } else if (meses == 120) { // 10 anos
        m = 16.4;
        sd = 18.5 - m;
      } else if (meses == 132) { // 11 anos
        m = 16.9;
        sd = 19.2 - m;
      } else if (meses == 144) { // 12 anos
        m = 17.5;
        sd = 19.9 - m;
      } else if (meses == 156) { // 13 anos
        m = 18.2;
        sd = 20.8 - m;
      } else if (meses == 168) { // 14 anos
        m = 19.0;
        sd = 21.8 - m;
      } else if (meses == 180) { // 15 anos
        m = 19.8;
        sd = 22.7 - m;
      } else if (meses == 192) { // 16 anos
        m = 20.5;
        sd = 23.5 - m;
      } else if (meses == 204) { // 17 anos
        m = 21.1;
        sd = 24.3 - m;
      } else if (meses == 216) { // 18 anos
        m = 21.7;
        sd = 26.1 - m;
      } else if (meses == 228) { // 19 anos
        m = 22.2;
        sd = 25.4 - m;
      }
    } else if (sexo == "Feminino") {

      if (meses == 0) {
        m = 13.3;
        sd = 14.6 - m;
      } else if (meses == 1) {
        m = 14.6;
        sd = 16.0 - m;
      } else if (meses == 2 || meses == 17) {
        m = 15.8;
        sd = 17.3 - m;
      } else if (meses == 3 || meses == 12) {
        m = 16.4;
        sd = 17.9 - m;
      } else if (meses == 4 || meses == 9) {
        m = 16.7;
        sd = 18.3 - m;
      } else if (meses == 5 || meses == 8) {
        m = 16.8;
        sd = 18.4 - m;
      } else if (meses == 6 || meses == 7) {
        m = 16.9;
        sd = 18.5 - m;
      } else if (meses == 10) {
        m = 16.6;
        sd = 18.2 - m;
      } else if (meses == 11) {
        m = 16.5;
        sd = 18.0 - m;
      } else if (meses == 13) {
        m = 16.2;
        sd = 17.7 - m;
      } else if (meses == 14) {
        m = 16.1;
        sd = 17.6 - m;
      } else if (meses == 15) {
        m = 16.0;
        sd = 17.5 - m;
      } else if (meses == 16) {
        m = 15.9;
        sd = 17.4 - m;
      } else if (meses == 18) {
        m = 15.7;
        sd = 17.2 - m;
      } else if (meses == 19) {
        m = 15.7;
        sd = 17.1 - m;
      } else if (meses == 20) {
        m = 15.6;
        sd = 17.0 - m;
      } else if (meses == 21) {
        m = 15.5;
        sd = 17.0 - m;
      } else if (meses == 22 || meses == 23) {
        m = 15.5;
        sd = 16.9 - m;
      } else if (meses == 24) {
        m = 15.4;
        sd = 16.8 - m;
      } else if (meses == 25) {
        m = 15.7;
        sd = 17.1 - m;
      } else if (meses == 26 || meses == 27 || meses == 28 || meses == 29) {
        m = 15.6;
        sd = 17.0 - m;
      } else if (meses == 30 || meses == 31 || meses == 32 || meses == 33) {
        m = 15.5;
        sd = 16.9 - m;
      } else if (meses == 34 || meses == 35 || meses == 36 || meses == 37 || meses == 38) {
        m = 15.4;
        sd = 16.8 - m;
      } else if (meses == 39 || meses == 40 || meses == 41 || meses == 42 || meses == 43 || meses == 44 || meses == 45 || meses == 46 || meses == 47 || meses == 48 || meses == 49 || meses == 50 || meses == 51 || meses == 53 || meses == 54 || meses == 55 || meses == 56) {
        m = 15.3;
        sd = 16.8 - m;
      } else if (meses == 52) {
        m = 15.2;
        sd = 16.8 - m;
      } else if (meses == 57 || meses == 58 || meses == 59 || meses == 60) {
        m = 15.3;
        sd = 16.9 - m;
      } else if (meses == 72) { // 6 anos
        m = 15.3;
        sd = 17.0 - m;
      } else if (meses == 84) { // 7 anos
        m = 15.4;
        sd = 17.3 - m;
      } else if (meses == 96) { // 8 anos
        m = 15.7;
        sd = 17.7 - m;
      } else if (meses == 108) { // 9 anos
        m = 16.1;
        sd = 18.3 - m;
      } else if (meses == 120) { // 10 anos
        m = 16.6;
        sd = 19.0 - m;
      } else if (meses == 132) { // 11 anos
        m = 17.2;
        sd = 19.9 - m;
      } else if (meses == 144) { // 12 anos
        m = 18.0;
        sd = 20.8 - m;
      } else if (meses == 156) { // 13 anos
        m = 18.8;
        sd = 21.8 - m;
      } else if (meses == 168) { // 14 anos
        m = 19.6;
        sd = 22.7 - m;
      } else if (meses == 180) { // 15 anos
        m = 20.2;
        sd = 23.5 - m;
      } else if (meses == 192) { // 16 anos
        m = 20.7;
        sd = 24.1 - m;
      } else if (meses == 204) { // 17 anos
        m = 21.0;
        sd = 24.5 - m;
      } else if (meses == 216) { //18 anos
        m = 21.3;
        sd = 24.8 - m;
      } else if (meses == 228) { //19 anos
        m = 21.4;
        sd = 25.0 -m ;
      }
    }


    return (imc - m) / sd;
  }

  String classificarZImc(double zImc, int meses) {
    if (meses <= 60) {
      if (zImc < -3) return 'Disnutrição grave';
      if (zImc < -2) return 'Disnutrido';
      if (zImc >= -2 && zImc < 1) return 'Peso normal';
      if (zImc >= 1 && zImc < 2) return 'Risco de sobrepeso';
      if (zImc >= 2 && zImc <= 3) return 'Sobrepeso';
      return 'Obesidade';
    } else {
      if (zImc < -3) return 'Disnutrição grave';
      if (zImc < -2) return 'Disnutrido';
      if (zImc >= -2 && zImc <= 1) return 'Peso normal';
      if (zImc > 1 && zImc <= 2) return 'Sobrepeso';
      if (zImc > 2 && zImc <= 3) return 'Obesidade';
      return 'Obesidade grave';
    }
  }

  String classificarIMC(double imc) {
    if (imc < 18.5) return 'Abaixo do peso';
    if (imc < 24.9) return 'Peso normal';
    if (imc < 29.9) return 'Sobrepeso';
    if (imc < 34.9) return 'Obesidade grau 1';
    if (imc < 39.9) return 'Obesidade grau 2';
    return 'Obesidade grau 3';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      body: Stack(
        children: [
          Positioned.fill(child: OndasVerdes()),
          SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 60),
                  Center(
                    child: Column(
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            color: Color(0xFF74ED50),
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'CALCULADORA IMC',
                          style: TextStyle(
                            color: Color(0xFFD9FBCC),
                            fontSize: 30,
                            letterSpacing: 1.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            color: Colors.grey[850],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          alignment: Alignment.centerLeft,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              isExpanded: true,
                              value: tipo,
                              dropdownColor: Colors.grey[850],
                              style: const TextStyle(color: Colors.white70, fontWeight: FontWeight.bold),
                              onChanged: (String? newValue) {
                                setState(() {
                                  tipo = newValue!;
                                  imc = null;
                                  zImc = null;
                                  classificacaoImc = null;
                                  classificacaoZImc = null;
                                });
                              },
                              items: ['Adulto', 'Criança']
                                  .map((value) => DropdownMenuItem(value: value, child: Text(value)))
                                  .toList(),
                            ),
                          ),
                        ),
                      ),
                      if (tipo == "Criança") ...[
                        const SizedBox(width: 16, height: 20),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              color: Colors.grey[850],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            alignment: Alignment.centerLeft,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                isExpanded: true,
                                value: sexo,
                                dropdownColor: Colors.grey[850],
                                style: const TextStyle(color: Colors.white70, fontWeight: FontWeight.bold),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    sexo = newValue!;
                                    zImc = null;
                                    classificacaoZImc = null;
                                  });
                                },
                                items: ['Masculino', 'Feminino']
                                    .map((value) => DropdownMenuItem(value: value, child: Text(value)))
                                    .toList(),
                              ),
                            ),
                          ),
                        ),
                      ]
                    ],
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: pesoController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'Peso (kg)',
                      labelStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      filled: true,
                      fillColor: Colors.grey[850],
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: alturaController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'Altura (m)',
                      labelStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      filled: true,
                      fillColor: Colors.grey[850],
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  if (tipo == "Criança")
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              color: Colors.grey[850],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: DropdownButton<int>(
                              value: idadeAnos,
                              isExpanded: true,
                              dropdownColor: Colors.grey[850],
                              style: const TextStyle(color: Colors.white),
                              underline: const SizedBox(),
                              onChanged: (value) {
                                setState(() {
                                  idadeAnos = value!;
                                  if (idadeAnos >= 5) idadeMeses = 0;
                                });
                              },
                              items: List.generate(20, (i) => DropdownMenuItem(value: i, child: Text("$i anos"))),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        if (idadeAnos < 5)
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                color: Colors.grey[850],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: DropdownButton<int>(
                                value: idadeMeses,
                                isExpanded: true,
                                dropdownColor: Colors.grey[850],
                                style: const TextStyle(color: Colors.white),
                                underline: const SizedBox(),
                                onChanged: (value) {
                                  setState(() {
                                    idadeMeses = value!;
                                  });
                                },
                                items: List.generate(12, (i) => DropdownMenuItem(value: i, child: Text("$i meses"))),
                              ),
                            ),
                          ),
                      ],
                    ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: calcularIMC,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF5DE338),
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                      minimumSize: const Size(double.infinity, 60),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: const Text(
                      'CALCULAR',
                      style: TextStyle(color: Color(0xFFD9FBCC), fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 20),
                  if (imc != null && tipo == "Adulto")
                    Column(
                      children: [
                        Text(
                          'Seu IMC: ${imc!.toStringAsFixed(2)}',
                          style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          classificacaoImc ?? '',
                          style: const TextStyle(color: Colors.white70, fontSize: 16),
                        ),
                      ],
                    ),
                  if (zImc != null && tipo == "Criança")
                    Column(
                      children: [
                        Text(
                          'Z-IMC: ${zImc!.toStringAsFixed(2)}',
                          style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          classificacaoZImc ?? '',
                          style: const TextStyle(color: Colors.white70, fontSize: 16),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OndasVerdes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: OndaPainter());
  }
}

class OndaPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final altura = size.height;
    final largura = size.width;
    final paint = Paint()..style = PaintingStyle.fill;

    // ignore: duplicate_ignore
    // ignore: deprecated_member_use
    paint.color = const Color(0xFF74ED50).withOpacity(0.6);
    final path1 = Path()
      ..moveTo(0, altura * 0.8)
      ..quadraticBezierTo(largura * 0.25, altura * 0.75, largura * 0.5, altura * 0.85)
      ..quadraticBezierTo(largura * 0.75, altura * 0.95, largura, altura * 0.8)
      ..lineTo(largura, altura)
      ..lineTo(0, altura)
      ..close();
    canvas.drawPath(path1, paint);

    paint.color = const Color(0xFF81C784).withOpacity(0.5);
    final path2 = Path()
      ..moveTo(0, altura * 0.85)
      ..quadraticBezierTo(largura * 0.25, altura * 0.75, largura * 0.5, altura * 0.85)
      ..quadraticBezierTo(largura * 0.75, altura * 0.95, largura, altura * 0.85)
      ..lineTo(largura, altura)
      ..lineTo(0, altura)
      ..close();
    canvas.drawPath(path2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

