# StatefulWidget + Navigator  

## Atividade  
Descrição:


Nesta atividade, você deverá carregar o projeto Flutter no Firebase Studio e adaptar a aplica-
ção existente para incluir uma nova funcionalidade: uma lista de Pokémons. O projeto base já
possui uma estrutura com features, models, rotas, telas de listagem, telas de detalhes, cards e
BottomNavigationBar. Você deverá seguir o mesmo padrão já usado nas funcionalidades exis-
tentes, reaproveitando a arquitetura do projeto.  


Ao final, o usuário deverá conseguir:  
    • abrir o app;  
    • ver a nova opção “Pokémons” na BottomNavigationBar;  
    • acessar a tela de listagem de Pokémons;  
    • visualizar os Pokémons em cards;  
    • clicar em um card;  
    • navegar para a tela de detalhes do Pokémon selecionado.  

### Questão 1:  Estrutura da pasta 'lib'

1. Pasta app/ (Configurações Globais)  
O que armazena: O coração da inicialização do aplicativo.Funcionalidade: Contém as configurações principais e as rotas globais do sistema. É aqui que fica o widget raiz (geralmente o MaterialApp), a definição do tema central (cores em tons de verde que o professor mencionou) e o arquivo de mapeamento por onde o Navigator sabe qual tela abrir.  
2. Pasta core/ (Núcleo do Sistema)  
O que armazena: A infraestrutura técnica que faz o app funcionar por baixo dos panos.Funcionalidade: Guarda lógicas que não são visuais e que não pertencem a nenhuma funcionalidade específica. Inclui integrações com banco de dados, clientes HTTP para requisições de API, tratamento de erros genéricos e constantes. É o "motor" do app.  
3. Pasta features/ (Funcionalidades de Negócio)  
O que armazena: Onde o trabalho real acontece. O projeto base já possui essa estrutura.  Funcionalidade: Divide o aplicativo pelas suas funcionalidades práticas. Em vez de agrupar todos os arquivos por tipo (todas as telas juntas), agrupa por contexto. Você terá uma pasta pokemons/ aqui dentro, e dentro dela ficarão estritamente as telas de listagem, as telas de detalhes, os cards e as rotas específicas da Pokédex.  
4. Pasta shared/ (Componentes Compartilhados)  
O que armazena: Elementos reutilizáveis por todo o aplicativo.Funcionalidade: Tudo o que pode ser usado em mais de uma feature vem para cá. Se o botão de "favoritar" for usado tanto na Pokédex quanto em uma futura tela de "Meus Favoritos", o código desse botão mora no shared. O mesmo vale para a BottomNavigationBar, fontes de texto padronizadas ou modelos de dados genéricos. Isso evita duplicação de código.

### Questão 2: Mapeamento de nova rota  
Novas inserções no arquivo `app_routes.dart`

Foram adicionadas as seguintes linhas:  

```dart
// INSERÇÃO NOVA: Definição da constante de identificação da rota dos Pokémons
static const String detalhesPokemon = '/detalhes-pokemon';

// INSERÇÃO NOVA: Mapeamento que conecta a rota ao Widget correspondente
detalhesPokemon: (context) => const DetalhesPokemonPage(),
```

### Questão 3: Nova ação na BottomNavigation  
Descomentando a parte do `home_bottom_navigation.dart` (já adicionada anteriormente):  
```
// INSERÇÃO: Botão da tela de Pokémons descomentado
BottomNavigationBarItem(
  icon: Icon(Icons.catching_pokemon_outlined),
  activeIcon: Icon(Icons.catching_pokemon),
  label: 'Pokémons',
),
```

Incluído as linhas dentro do `home_page.dart`:  
```
// INSERÇÃO NOVA: Import da tela de listagem de Pokémons
import '../pokemons/pokemons_page.dart';

// INSERÇÃO NOVA: Adicionando a página na lista de renderização
PokemonsPage(),

Descomentado:
// A ordem desta lista deve bater com a ordem de _paginas.
'Pokémons',
```

Criado o arquivo `./pokemons/pokemons_page.dart` com Scaffold.  

Explicação da troca de telas com o BottomNavigationBar: 
    A troca de contexto ocorre através do gerenciamento de estado local na HomePage, que é um StatefulWidget.  
    O processo funciona da seguinte forma:  
    1. Estado Central: A classe _HomePageState mantém a variável _indiceSelecionado, que rastreia qual aba está ativa, e duas listas paralelas: _paginas (contendo os Widgets de cada tela) e _titulos (contendo os textos da AppBar).  
    2. Interação: Quando o usuário toca em um item da HomeBottomNavigation, a função _alterarPagina é chamada, recebendo o novo índice escolhido.  
    3. Reconstrução (State): A função executa o método setState(), atualizando o _indiceSelecionado e sinalizando ao Flutter que a interface precisa ser reconstruída.  
    4. Renderização com IndexedStack: O corpo da tela (body) utiliza o widget IndexedStack. Ele carrega todos os widgets da lista _paginas de uma só vez, mas exibe apenas aquele que corresponde ao _indiceSelecionado. Isso garante uma troca instantânea  e preserva o estado interno de cada tela (posição de rolagem, dados inseridos, etc.) enquanto o usuário navega entre as abas.

### Questão 4: Cria Classe Pokémon
    Com base na prova pratica do 1 bimestre, foi adaptado para esta atividade (equivalente ao `produto.dart`).  
    Linhas modificadas (da prova) foram comentadas no código.  
    
    Criação do arquivo `.lib/shared/models.pokemon.dart`.

### Questão 5: 