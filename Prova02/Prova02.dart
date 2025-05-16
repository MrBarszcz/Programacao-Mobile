import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(const TheJogoApp());

class TheJogoApp extends StatelessWidget {
  const TheJogoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF641A7D),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      home: const TheJogoHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TheJogoHomePage extends StatefulWidget {
  const TheJogoHomePage({super.key});

  @override
  State<TheJogoHomePage> createState() => _TheJogoHomePageState();
}

class _TheJogoHomePageState extends State<TheJogoHomePage> {
  String mensagem = "Encontre o tesouro escondido!";
  List<String> botoes = List.filled(20, "");
  bool jogoEncerrado = false;
  int? tesouro;
  int? bomba;
  int? monstro;

  @override
  void initState() {
    super.initState();
    novoJogo();
  }

  void novoJogo() {
    final random = Random();
    Set<int> numeros = {};

    while (numeros.length < 3) {
      numeros.add(random.nextInt(20));
    }

    List<int> sorteados = numeros.toList();
    tesouro = sorteados[0];
    bomba = sorteados[1];
    monstro = sorteados[2];

    setState(() {
      mensagem = "Encontre o tesouro escondido!";
      botoes = List.filled(20, "");
      jogoEncerrado = false;
    });
  }

  void pressionarBotao(int index) {
    if (jogoEncerrado || botoes[index] != "") return;

    setState(() {
      if (index == tesouro) {
        mensagem = "🏆 Você encontrou o tesouro! Parabéns!";
        botoes[index] = "🏆";
        jogoEncerrado = true;
        desabilitarTodosMenos(index);
      } else if (index == bomba) {
        mensagem = "💣 Você encontrou uma bomba! Fim de jogo!";
        botoes[index] = "💣";
        jogoEncerrado = true;
        desabilitarTodosMenos(index);
      } else if (index == monstro) {
        mensagem = "👾 Um monstro te pegou! Fim de jogo!";
        botoes[index] = "👾";
        jogoEncerrado = true;
        desabilitarTodosMenos(index);
      } else {
        if (index < tesouro!) {
          mensagem = "🔼 O tesouro está em um número maior!";
        } else {
          mensagem = "🔽 O tesouro está em um número menor!";
        }
        botoes[index] = "❓";
      }
    });
  }

  void desabilitarTodosMenos(int indexEspecial) {
    for (int i = 0; i < botoes.length; i++) {
      if (i != indexEspecial && botoes[i] == "") {
        botoes[i] = "🚫";
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "THE JOGO",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF641A7D),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Instruções fixas na tela
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "INSTRUÇÕES DO JOGO",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "- O tesouro está escondido em um número entre 1 e 20.\n"
                    "- Cuidado com a bomba 💣 e o monstro 👾! Se clicar em um desses, o jogo acaba.\n"
                    "- Cada clique dá uma dica sobre a localização do tesouro.\n"
                    "- Encontre o tesouro 🏆 para vencer o jogo!\n",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                itemCount: 20,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  childAspectRatio: 1,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemBuilder: (context, index) {
                  return ElevatedButton(
                    onPressed: botoes[index] == "" ? () => pressionarBotao(index) : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFF9C4), // amarelo bem claro
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      padding: const EdgeInsets.all(0),
                      foregroundColor: Colors.black,
                    ),
                    child: Center(
                      child: Text(
                        botoes[index] == "" ? "${index + 1}" : botoes[index],
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 5),

            Text(
              mensagem,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),

            
            const SizedBox(height: 30),
            ElevatedButton.icon(
              key: const ValueKey('novo_jogo'),
              onPressed: novoJogo,
              icon: const Icon(Icons.refresh),
              label: const Text(
                "NOVO JOGO",
                style: TextStyle(
                  color: Color(0xFFFFCDD2), // vermelho claro
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // vermelho escuro
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
