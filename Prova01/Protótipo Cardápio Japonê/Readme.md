# Shinobi Bistrô – Cardápio Japonês Interativo

Aplicativo Flutter desenvolvido por:

- Marcos Paulo Barszcz Alves  
- Byanca Prado Rosa Hamilko Chaves

O aplicativo **"Shinobi Bistrô"** é uma solução moderna e visualmente elegante para a apresentação de um cardápio digital de restaurante japonês. Desenvolvido em Flutter com design dark premium, o app oferece aos usuários uma experiência fluida e prática para conhecer os pratos, selecionar quantidades e adicionar itens ao carrinho de pedidos.

## 🥢 Funcionalidades Principais

- **Cardápio Visual e Organizado**: Lista completa de pratos típicos da culinária japonesa, como sushi, temaki, yakissoba, entre outros, com nome, descrição e preço.
- **Seleção de Quantidade**: Cada prato permite ao usuário ajustar a quantidade desejada com botões intuitivos de “+” e “–”.
- **Botão de Carrinho**: Os usuários podem adicionar os pratos escolhidos ao carrinho de forma prática, com feedback visual.
- **Design Personalizado**: Interface com cores preto, vermelho e branco, refletindo a identidade visual do restaurante.

Ideal para tablets ou totens de autoatendimento em restaurantes, o app é totalmente responsivo e pode ser expandido para incluir funcionalidades como tela de checkout, pedidos via QR Code ou integração com sistemas de pagamento.

---

## ⚙️ Componentes Técnicos (Widgets e Layouts)

### 1. Estrutura do App e Tema Global

```dart
void main() => runApp(CardapioJaponesApp());

class CardapioJaponesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cardápio Japonês',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.dark(
          primary: Color(0xFFBD0000), // Vermelho
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
```

> `MaterialApp`: define o tema global, aparência e ponto de entrada da aplicação.

---

### 2. Scaffold: Estrutura da Tela

```dart
Scaffold(
  appBar: AppBar(
    backgroundColor: Colors.black,
    centerTitle: true,
    title: const LogoShinobiBistro(),
  ),
  body: Padding(
    padding: const EdgeInsets.all(8),
    child: GridView.builder(
      itemCount: pratos.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 2 / 2.6,
      ),
      itemBuilder: (context, index) { ... },
    ),
  ),
);
```

> `GridView.builder`: Layout em grade de 2 colunas para exibir os cards de pratos.

---

### 3. Logo Personalizada

```dart
class LogoShinobiBistro extends StatelessWidget {
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
```

> `Stack + CircleAvatar + RichText`: combinam a identidade visual da marca com tipografia estilizada.

---

### 4. Grid de Pratos com Card

```dart
Card(
  color: Colors.grey[900],
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Text(prato['nome']!),
      Text(prato['descricao']!),
      Text(prato['preco']!),
      ElevatedButton(...),
    ],
  ),
);
```

> `Card`: estrutura para exibir o prato, sua descrição, preço e botão de ação.

---

### 5. Botão "Fazer Pedido"

```dart
ElevatedButton(
  style: ElevatedButton.styleFrom(
    backgroundColor: Color(0xFFBD0000),
    foregroundColor: Colors.white,
    minimumSize: const Size.fromHeight(36),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  onPressed: () {},
  child: const Text('Fazer Pedido'),
)
```

> Botão estilizado com cor vermelha (BD0000) e ação programável.
