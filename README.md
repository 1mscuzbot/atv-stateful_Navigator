# StatefulWidget + Navigator - Pokédex Flutter

Equipe: Davi Emannoel, João Thomaz, Klaus Siegfried, Lucas Müller.

## 📋 Descrição da Atividade

Nesta atividade, o projeto base em Flutter foi desenvolvido localmente e adaptado para incluir uma nova funcionalidade completa: uma lista de Pokémons (Pokédex). Seguindo as diretrizes de arquitetura, padrões de design e modularização do projeto original, a aplicação estende as features existentes reaproveitando os componentes e contratos pré-configurados.

**Objetivos alcançados na experiência do usuário:**
* Inicialização limpa do ecossistema mobile;
* Inclusão dinâmica da opção “Pokémons” na `BottomNavigationBar`;
* Exibição dos dados em uma grade responsiva com `GridView`;
* Componentização visual dos elementos em formato de Cards temáticos;
* Fluxo completo de navegação e transporte de argumentos (`Navigator.pushNamed`);
* Tela de detalhes rica com exibição de atributos herdados de regras de negócio anteriores.

---

## 🛠️ Resolução das Questões

### Questão 1: Estrutura da pasta `lib`

A divisão arquitetural do projeto base adota o padrão **Feature-First (Arquitetura Baseada em Funcionalidades)**, organizando o código por contexto de negócio em vez de tipo de arquivo:

1. **Pasta `app/` (Configurações Globais)**
   * **O que armazena:** O núcleo de inicialização global do app.
   * **Funcionalidade:** Centraliza o widget raiz (`MaterialApp`), configurações de temas visuais (como os tons de verde padronizados) e o arquivo concentrador de mapeamento de rotas nomeadas.
2. **Pasta `core/` (Núcleo do Sistema)**
   * **O que armazena:** A infraestrutura técnica e motores de baixo nível.
   * **Funcionalidade:** Guarda lógicas não visuais compartilhadas globalmente, como clientes HTTP, conexões com serviços locais, tratamento abstrato de exceções e utilitários de sistema.
3. **Pasta `features/` (Funcionalidades de Negócio)**
   * **O que armazena:** O domínio das regras de negócio do aplicativo de forma isolada.
   * **Funcionalidade:** Divide o app por contextos independentes. A nova pasta `pokemons/` encapsula estritamente suas próprias telas de listagem, detalhes, sub-widgets locais e controladores de fluxo.
4. **Pasta `shared/` (Componentes Compartilhados)**
   * **O que armazena:** Elementos comuns reutilizáveis por múltiplas features.
   * **Funcionalidade:** Evita a duplicação de código (*DRY - Don't Repeat Yourself*). Concentra models de dados genéricas, componentes de interface transversais (como barras de navegação comuns) e estilos compartilhados.

### Questão 2: Mapeamento de Nova Rota
Novas inserções realizadas no arquivo `lib/app/app_routes.dart` para registrar a tela de exibição detalhada:

```dart
// INSERÇÃO NOVA: Definição da constante de identificação da rota dos Pokémons
static const String detalhesPokemon = '/detalhes-pokemon';

// INSERÇÃO NOVA: Mapeamento que conecta a rota ao Widget correspondente
detalhesPokemon: (context) => const DetalhesPokemonPage(),
```

### Questão 3: Nova Ação na BottomNavigation

Ativação do item de menu correspondente na barra inferior através do arquivo lib/features/home/widget/home_bottom_navigation.dart:
```dart
// INSERÇÃO: Botão da tela de Pokémons descomentado
BottomNavigationBarItem(
  icon: Icon(Icons.catching_pokemon_outlined),
  activeIcon: Icon(Icons.catching_pokemon),
  label: 'Pokémons',
),
```
Inclusão das dependências e da lógica estrutural na página principal em lib/features/home/home_page.dart:
```dart
// INSERÇÃO NOVA: Import da tela de listagem de Pokémons
import '../pokemons/pokemons_page.dart';

// INSERÇÃO NOVA: Adicionando a página na lista de renderização do IndexedStack
PokemonsPage(),

// INSERÇÃO NOVA: Alinhamento de títulos na mesma posição do índice da página
'Pokémons',
```
* Explicação da troca de telas com o BottomNavigationBar:
  A alternância de abas ocorre via gerenciamento de estado local na HomePage (StatefulWidget).

  1. Estado Central: A classe _HomePageState gerencia a variável primitiva _indiceSelecionado, usada para indexar os itens das coleções paralelas de _paginas e _titulos.

  2. Interação: Ao clicar na barra, o gatilho onTap despacha o novo índice para a função _alterarPagina.

  3. Reconstrução Reativa: O método setState() atualiza a variável de estado, notificando o framework para re-renderizar a árvore de componentes afetada.

  4. IndexedStack: O corpo (body) do Scaffold implementa o widget IndexedStack. Ele mantém todas as páginas pré-carregadas em memória para manter o estado interno de rolagem e dados intactos, mas exibe de forma instantânea apenas o filho posicionado no índice ativo, impedindo o empilhamento desnecessário de rotas nativas.

### Questão 4: Criação da Model Pokémon

Com base nas classes desenvolvidas na Prova Prática do 1º Bimestre, a estrutura foi convertida para o modelo de dados imutáveis do Flutter, adaptando atributos legados para o padrão de nomenclatura camelCase.
* Arquivo criado em: lib/shared/models/pokemon.dart

### Questão 5 e 7: Tela de Listagem + Lista Fake de Pokemons
* Arquivo criado em: lib/features/pokemons/pokemons_page.dart

A tela consome uma lista mockada contendo 12 Pokémons (compostos pelos 3 iniciais das três primeiras gerações clássicas, Pikachu, Mew e Mewtwo). Para mitigar as restrições de segurança de políticas de CORS impostas pelo Chrome no ambiente Flutter Web, os endpoints das imagens foram apontados para o repositório estável de arquivos públicos (raw) da PokeAPI no GitHub. A renderização utiliza o componente performático GridView.builder distribuído em duas colunas.

### Questão 6: Layout dos Cards
* Arquivo criado em: lib/features/pokemons/widgets/pokemon_card.dart

Seguindo a regra de componentização e desacoplamento de código, o card individual foi isolado em uma subpasta de widgets. Características implementadas:

   * Card estruturado com bordas arredondadas e contornos na paleta de cores verde;

   * Revestimento com widget InkWell para fornecer animação responsiva de toque por efeito cascata;

   * Injeção da propriedade FilterQuality.none na renderização das imagens para preservar o visual serrilhado nítido característico de Pixel Art retrô (estilo Game Boy Advance / Nintendo DS).

### Questão 8: Tela de Detalhes
* Arquivo criado em: lib/features/pokemons/detalhes_pokemon_page.dart

Respeitando a identidade visual minimalista e plana (flat) do fluxo de produtos original do professor, a interface descarta blocos de elevação flutuantes:

   * Alinhamento Assíncrono: Uso do alinhamento CrossAxisAlignment.start para direcionar todo o conteúdo textual estritamente para a margem esquerda;

   * Ficha Técnica Abstrata: Exibição da imagem em banner superior amplo, nome com indexação numérica (#000), chip identificador de elementos, além das estatísticas de jogo herdadas da prova (Nível, HP Atual/Máximo e flag de Captura) acompanhadas de ícones nativos.

### Questão 9: Evento de Navegação do Card para os Detalhes

A fiação entre as telas foi estabelecida configurando o callback de clique do card. O método encapsula a chamada do Navigator injetando o objeto instanciado via argumento tipado:
```Dart
onTap: () {
  Navigator.pushNamed(
    context,
    '/detalhes-pokemon', // Rota configurada na Questão 2
    arguments: pokemon,   // Objeto completo contendo o estado do Pokémon
  );
},
```
Na classe receptora (DetalhesPokemonPage), a extração é efetuada diretamente no escopo do ciclo de construção (build):
```Dart
final pokemon = ModalRoute.of(context)!.settings.arguments as Pokemon;
```

### 🚀 Desafio Adicional Implementado
1. Botão de gostar / desgostar (StatefulWidget)

A página DetalhesPokemonPage foi voluntariamente convertida para um StatefulWidget para suportar a reatividade de estado local.

No rodapé da interface de detalhes, foi acoplado um botão horizontal estendido (Full-width) persistente, espelhando a usabilidade do botão "Adicionar ao carrinho" de produtos:

* Mutação de Estado: O gatilho onPressed executa o método setState(), invertendo o valor lógico booleano da propriedade pokemon.favorito.

* Feedback Visual Imediato: O componente redesenha a árvore mudando dinamicamente sua cor (Verde com ícone vazado para Gostar / Vermelho com ícone preenchido para Remover dos Favoritos) e alterando as strings textuais em tempo real de acordo com o clique.