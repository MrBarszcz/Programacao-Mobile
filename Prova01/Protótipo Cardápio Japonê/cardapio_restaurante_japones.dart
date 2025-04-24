import 'package:flutter/material.dart';

void main() => runApp(CardapioJaponesApp());

class CardapioJaponesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cardápio Japonês',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.dark(
          primary: Color(0xFFBD0000),
          surface: Colors.black,
          onPrimary: Colors.white,
        ),
        scaffoldBackgroundColor: Colors.black,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white70),
        ),
      ),
      home: const CardapioPage(),
    );
  }
}

class CardapioPage extends StatefulWidget {
  const CardapioPage({super.key});

  @override
  State<CardapioPage> createState() => _CardapioPageState();
}

class _CardapioPageState extends State<CardapioPage> {
  final List<Map<String, dynamic>> pratos = [
    {
      'nome': 'Sushi de Salmão',
      'descricao': 'Fatias frescas de salmão sobre arroz temperado.',
      'preco': 'R\$ 24,90',
      'quantidade': 0
    },
    {
      'nome': 'Temaki de Atum',
      'descricao': 'Cone de alga recheado com atum e arroz.',
      'preco': 'R\$ 19,90',
      'quantidade': 0
    },
    {
      'nome': 'Yakissoba',
      'descricao': 'Macarrão oriental com legumes e carne.',
      'preco': 'R\$ 29,90',
      'quantidade': 0
    },
    {
      'nome': 'Hot Roll',
      'descricao': 'Sushi empanado e frito, recheado com cream cheese.',
      'preco': 'R\$ 21,50',
      'quantidade': 0
    },
    {
      'nome': 'Guioza',
      'descricao': 'Pasteizinhos japoneses recheados e grelhados.',
      'preco': 'R\$ 18,00',
      'quantidade': 0
    },
    {
      'nome': 'Missoshiru',
      'descricao': 'Sopa tradicional de missô com tofu e cebolinha.',
      'preco': 'R\$ 12,00',
      'quantidade': 0
    },
  ];

  void incrementar(int index) {
    setState(() {
      pratos[index]['quantidade']++;
    });
  }

  void decrementar(int index) {
    setState(() {
      if (pratos[index]['quantidade'] > 0) {
        pratos[index]['quantidade']--;
      }
    });
  }

  void adicionarAoCarrinho(int index) {
    final nome = pratos[index]['nome'];
    final qtd = pratos[index]['quantidade'];
    if (qtd > 0) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('$qtd x $nome adicionado(s) ao carrinho.'),
        duration: Duration(seconds: 2),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const LogoShinobiBistro(),
      ),
      body: ListView.builder(
        itemCount: pratos.length,
        itemBuilder: (context, index) {
          final prato = pratos[index];
          return Card(
            color: Colors.grey[900],
            margin: const EdgeInsets.all(8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    prato['nome'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    prato['descricao'],
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    prato['preco'],
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFBD0000),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove_circle, color: Colors.white),
                            onPressed: () => decrementar(index),
                          ),
                          Text(
                            '${prato['quantidade']}',
                            style: const TextStyle(color: Colors.white),
                          ),
                          IconButton(
                            icon: const Icon(Icons.add_circle, color: Colors.white),
                            onPressed: () => incrementar(index),
                          ),
                        ],
                      ),
                      ElevatedButton.icon(
                        onPressed: () => adicionarAoCarrinho(index),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFBD0000),
                          foregroundColor: Colors.white,
                        ),
                        icon: const Icon(Icons.shopping_cart_outlined),
                        label: const Text('Adicionar'),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class LogoShinobiBistro extends StatelessWidget {
  const LogoShinobiBistro({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            const CircleAvatar(
              radius: 28,
              backgroundColor: Color(0xFFBD0000),
            ),
            RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Righteous',
                  color: Colors.black,
                ),
                children: [
                  TextSpan(text: 'SHINO'),
                  TextSpan(text: 'BI'),
                  TextSpan(text: ' BISTRÔ'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
