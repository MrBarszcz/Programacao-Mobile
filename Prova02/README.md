# The Jogo - Aplicativo Flutter

## Autores

- Byanca Prado Rosa Hamilko Chaves
- Marcos Paulo Barszcz Alves



## Ideia

Desenvolver um aplicativo Flutter intitulado "The Jogo", cujo objetivo é permitir que o usuário interaja com uma grade de botões numerados para encontrar um tesouro escondido.



## Descrição do Aplicativo

O aplicativo "The Jogo" apresenta uma interface interativa onde o usuário precisa descobrir a localização de um tesouro em uma grade de botões. O jogo fornece dicas para guiar o usuário, adicionando um elemento de estratégia e diversão.

## Protótipo

A interface e a lógica de funcionamento seguem os seguintes requisitos:

- Um campo de texto, usando `Text`, na parte superior para exibir mensagens e instruções do jogo.
- Uma grade de 20 botões numerados (de 1 a 20), utilizando `ElevatedButton`, com espaçamento adequado e responsividade.
- Um botão adicional com o rótulo "Novo Jogo" para reiniciar a aplicação.

## Regras do Jogo

Ao iniciar um novo jogo, três números distintos entre 1 e 20 são sorteados:

- Um número representa o tesouro 🏆
- Um número representa a bomba 💣
- Um número representa o monstro 👾

Cada botão da interface corresponde a um número entre 1 e 20. Ao ser pressionado:

- Se for o número do tesouro, o jogo exibe mensagem de vitória, altera o botão pressionado para um emoji de tesouro e desabilita os demais botõese altera eles para um emoji de bloqueio.
- Se for o número do monstro ou da bomba, o jogo exibe mensagem de derrota, altera o botão pressionado para um emoji correspondente e desabilita os demais botões e altera eles para um emoji de bloqueio.
- Caso contrário, uma dica deve ser exibida informando se o número do tesouro está acima ou abaixo do número pressionado. O botão é alterado para um emoji indicativo de dica e permanece desabilitado.

O botão "Novo Jogo" reinicializa o estado do jogo, incluindo novo sorteio dos três números e limpeza das mensagens e botões.

## Explicação da Lógica do Jogo (com base no código)

A classe `_TheJogoHomePageState` é responsável por gerenciar o estado do jogo e a interação do usuário.

1. **Variáveis de Estado:**
    - `mensagem` (String): Armazena a mensagem exibida para o usuário (instruções, dicas, resultados).
    - `botoes` (List\<String>): Uma lista que representa o estado de cada botão na grade. Inicialmente, todos estão vazios (""). Ao serem clicados, são atualizados com emojis (🏆, 💣, 👾, ❓, 🚫).
    - `jogoEncerrado` (bool): Indica se o jogo terminou (true) ou não (false).
    - `tesouro`, `bomba`, `monstro` (int?): Armazenam os índices dos botões que correspondem ao tesouro, à bomba e ao monstro, respectivamente. O "?" indica que podem ser nulos (no início do jogo).
2. **Inicialização (`initState()`):**
    - O método `initState()` é chamado quando o widget `_TheJogoHomePageState` é criado.
    - `super.initState()`: Chama o método `initState()` da classe pai.
    - `novoJogo()`: Chama a função `novoJogo()` para iniciar um novo jogo e inicializar o estado.
3. **Novo Jogo (`novoJogo()`):**
    - `final random = Random();`: Cria um gerador de números aleatórios.
    - `Set\\<int> numeros = {};`: Cria um conjunto (Set) para armazenar números únicos.
    - `while (numeros.length < 3) { numeros.add(random.nextInt(20)); }`: Gera 3 números aleatórios únicos entre 0 e 19 e os armazena no conjunto.
    - `List\\<int> sorteados = numeros.toList();`: Converte o conjunto de números em uma lista.
    - `tesouro = sorteados[0]; bomba = sorteados[1]; monstro = sorteados[2];`: Atribui os 3 números sorteados às variáveis `tesouro`, `bomba` e `monstro`.
    - `setState(() { ... });`: Atualiza o estado do widget, fazendo com que a interface do usuário seja reconstruída:
        - `mensagem = "Encontre o tesouro escondido!";`: Define a mensagem inicial.
        - `botoes = List.filled(20, "");`: Limpa o estado dos botões.
        - `jogoEncerrado = false;`: Indica que o jogo não está encerrado.
4. **Ação de Pressionar Botão (`pressionarBotao(int index)`):**
    - `if (jogoEncerrado || botoes[index] != "") return;`: Verifica se o jogo já terminou ou se o botão já foi pressionado. Se sim, a função retorna e nada acontece.
    - `setState(() { ... });`: Atualiza o estado do widget:
        - `if (index == tesouro) { ... }`: Se o botão pressionado for o do tesouro:
            - Atualiza a mensagem para vitória.
            - Marca o botão com o emoji de tesouro.
            - Define `jogoEncerrado` como `true`.
            - Chama `desabilitarTodosMenos(index)` para desabilitar os outros botões.
        - `else if (index == bomba) { ... }` ou `else if (index == monstro) { ... }`: Semelhante ao caso do tesouro, mas para bomba e monstro, com mensagens e emojis apropriados.
        - `else { ... }`: Se o botão não for tesouro, bomba ou monstro:
            - `if (index \\< tesouro!) { ... } else { ... }`: Fornece uma dica ao usuário: se o índice do botão for menor que o do tesouro, a dica diz que o tesouro está em um número maior; caso contrário, diz que está em um número menor. O "!" é usado para garantir que `tesouro` não é nulo neste ponto.
            - Marca o botão com o emoji de dica.
5. **Desabilitar Outros Botões (`desabilitarTodosMenos(int indexEspecial)`):**
    - `for (int i = 0; i \\< botoes.length; i++) { ... }`: Percorre todos os botões.
    - `if (i != indexEspecial && botoes[i] == "") { ... }`: Se o botão não for o botão especial (tesouro, bomba ou monstro) e ainda estiver vazio, marca-o com o emoji de desabilitado.

## Explicação Básica do Código

### Bibliotecas

- `dart:math` é a biblioteca que fornece funções matemáticas, como geração de números aleatórios.
- `package:flutter/material.dart` é uma biblioteca do Flutter que contém widgets (componentes de interface do usuário) e ferramentas para implementar o Material Design.

### Função

- `main()`
    - `void main() => runApp(const TheJogoApp());` é a função principal que, com uma *arrow function* (forma abreviada de escrever uma função), executa a instrução `runApp(const TheJogoApp())`.
    - `runApp()`: Esta é uma função do Flutter que infla (cria e exibe) o widget passado como parâmetro. Neste caso, `TheJogoApp` é o widget raiz da aplicação.

### Widgets

- `StatelessWidget`
    - `TheJogoApp` é um `StatelessWidget`.
    - Descrição: Widgets que não possuem estado mutável. Sua aparência e comportamento são determinados por suas propriedades e não mudam ao longo do tempo.
    - `build(BuildContext context)`: Método obrigatório que descreve a interface do usuário do widget. Retorna a árvore de widgets a ser construída.
    - Estilização: `StatelessWidget` em si não oferece estilização direta. A estilização é definida pelos widgets que ele contém (como `MaterialApp`, `Container`, `Text`, etc.).
- `MaterialApp`
    - Descrição: Widget que configura a aplicação com temas, rotas e outras configurações do Material Design.
    - Propriedades Importantes:
        - `theme`: Define o tema geral da aplicação (cores, fontes, etc.). A estilização é feita através de `ThemeData`, que permite configurar várias propriedades visuais.
            - `ThemeData.dark()`: Fornece um tema escuro.
            - `copyWith()`: Método que permite modificar propriedades específicas de um tema existente.
            - `scaffoldBackgroundColor`: Define a cor de fundo das telas (`Scaffold`). A cor é definida usando a classe `Color`.
            - `appBarTheme`: Configura a estilização da `AppBar`. `AppBarTheme` permite estilizar a barra superior.
            - `textTheme`: Define estilos para textos. `TextTheme` permite configurar estilos para diferentes tipos de texto. Estilos de texto são definidos usando a classe `TextStyle`.
        - `home`: Define o widget que é exibido como a tela inicial da aplicação.
        - `debugShowCheckedModeBanner`: Controla a exibição da faixa de "Debug" no canto da tela.
    - Estilização: `MaterialApp` fornece o tema base para a aplicação. Cores, fontes e outros estilos são definidos através de suas propriedades, principalmente `theme`.
- `StatefulWidget`
    - `TheJogoHomePage` é um `StatefulWidget`.
    - Descrição: Widgets que possuem estado mutável. Eles podem se redesenhar quando seu estado interno muda.
    - `createState()`: Método obrigatório que cria e retorna o objeto de estado (`State`) associado a este widget.
- `State` (`_TheJogoHomePageState`)
    - Descrição: Classe que gerencia o estado de um `StatefulWidget`. É onde a lógica dinâmica do widget é implementada.
    - Variáveis de Estado: Variáveis declaradas dentro da classe `State` que armazenam os dados que podem mudar e afetam a aparência do widget.
    - `initState()`: Método chamado uma vez quando o objeto de estado é criado. Usado para inicialização.
    - `setState((){ ... })`: Método importante que notifica o Flutter para redesenhar a interface do usuário quando o estado muda.
    - `build(BuildContext context)`: Método obrigatório que descreve a interface do usuário do widget. Retorna a árvore de widgets a ser construída.
- `Scaffold`
    - Descrição: Widget que fornece a estrutura básica da tela (`AppBar`, `body`, etc.).
    - Propriedades Importantes:
        - `appBar`: Exibe uma barra superior no app. É do tipo `AppBar`.
        - `body`: A área principal do conteúdo da tela. Pode conter qualquer widget.
    - Estilização: A estrutura geral é fornecida pelo `Scaffold`. A estilização dos elementos dentro dele (como a `AppBar` ou o `body`) é feita através das propriedades desses elementos ou widgets internos.
- `AppBar`
    - Descrição: Barra superior que geralmente exibe o título da tela e ações.
    - Propriedades Importantes:
        - `title`: O widget a ser exibido como título. Geralmente é um `Text`.
        - `backgroundColor`: Define a cor de fundo da barra. Usa a classe `Color`.
        - `centerTitle`: Controla se o título é centralizado.
    - Estilização: Cor de fundo, estilo do texto do título e alinhamento podem ser configurados.
- `Padding`
    - Descrição: Widget que adiciona espaço ao redor de outro widget.
    - Propriedades Importantes:
        - `padding`: Define a quantidade de espaço a ser adicionada. Usa a classe `EdgeInsets`.
    - Estilização: Apenas o espaço ao redor do widget filho é estilizado.
- `Column`
    - Descrição: Widget que organiza seus filhos em uma coluna vertical.
    - Propriedades Importantes:
        - `children`: Lista de widgets filhos.
    - Estilização: O alinhamento dos filhos dentro da coluna pode ser controlado.
- `Text`
    - Descrição: Widget para exibir texto.
    - Propriedades Importantes:
        - `style`: Define o estilo do texto (cor, fonte, tamanho, etc.). Usa a classe `TextStyle`.
        - `textAlign`: Controla o alinhamento do texto.
    - Estilização: Extensas opções de estilização de texto através da propriedade `style`.
- `SizedBox`
    - Descrição: Widget que cria um espaço vazio com uma largura e/ou altura específicas.
    - Propriedades Importantes:
        - `width`: Define a largura do espaço.
        - `height`: Define a altura do espaço.
    - Estilização: Apenas o espaço em si é estilizado (dimensões).
- `Container`
    - Descrição: Widget versátil que pode conter outros widgets e aplicar decoração (fundo, borda, etc.) e espaçamento.
    - Propriedades Importantes:
        - `padding`: Espaço dentro do container.
        - `decoration`: Estilização visual do container. Usa a classe `BoxDecoration`.
            - `color`: Cor de fundo.
            - `borderRadius`: Bordas arredondadas.
        - `child`: O widget filho contido.
    - Estilização: Altamente estilizado com `BoxDecoration` para cor, borda, fundo, etc.
- `Expanded`
    - Descrição: Widget que expande um filho em um `Row` ou `Column` para preencher o espaço disponível.
    - Propriedades Importantes:
        - `child`: O widget filho a ser expandido.
    - Estilização: A estilização é feita nos widgets filhos.
- `GridView.builder`
    - Descrição: Widget que cria uma grade de widgets. `builder` é usado para construir os widgets da grade sob demanda.
    - Propriedades Importantes:
        - `itemCount`: Número de itens na grade.
        - `gridDelegate`: Controla o layout da grade (`SliverGridDelegateWithFixedCrossAxisCount` para número fixo de colunas).
        - `itemBuilder`: Função que constrói cada item da grade.
    - Estilização: Estilização dos itens individuais é feita no `itemBuilder`. A grade em si é configurada com `gridDelegate`.
- `ElevatedButton`
    - Descrição: Botão com elevação (sombra).
    - Propriedades Importantes:
        - `onPressed`: Função chamada quando o botão é pressionado.
        - `style`: Estilização do botão. Usa `ButtonStyle` (ou `ElevatedButton.styleFrom` para conveniência).
            - `backgroundColor`: Cor de fundo.
            - `padding`: Espaçamento interno.
            - `shape`: Forma do botão (bordas arredondadas).
            - `foregroundColor`: Cor do texto e ícone.
        - `child`: O widget a ser exibido dentro do botão (geralmente um `Text`).
    - Estilização: Extensas opções de estilização através da propriedade `style`.
- `AnimatedSwitcher`
    - Descrição: Widget que faz a transição animada entre dois filhos quando um deles é substituído por outro.
    - Propriedades Importantes:
        - `duration`: Duração da animação.
        - `child`: O widget filho atualmente exibido.
    - Estilização: A animação em si é configurada com `duration` e `transitionBuilder`. A estilização dos widgets filhos é feita normalmente.
- `ElevatedButton.icon`
    - Descrição: Uma variação de `ElevatedButton` que inclui um ícone.
    - Propriedades Importantes:
        - Herda as propriedades de `ElevatedButton`.
        - `icon`: O widget do ícone.
        - `label`: O widget do rótulo (geralmente um `Text`).
    - Estilização: Igual a `ElevatedButton`.
