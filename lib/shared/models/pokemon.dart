//  Questão 4: Classes de origem da prova
//  int _numero;
//  String _nome;
//  String _tipo;
//  int _nivel;
//  int _hp_atual;
//  int _hp_maximo;
//  bool _capturado;

class Pokemon {
  // Atributos herdados da Prova
  final int numero;
  final String nome;
  final String tipo;
  final int nivel;
  final int hpAtual; // Convertido de hp_atual para camelCase
  final int hpMaximo; // Convertido de hp_maximo para camelCase
  final bool capturado;
  
  // Atributo controlado pelo Desafio Adicional (StatefulWidget)
  bool favorito;

  // Novos atributos exigidos na questão, para a Interface Visual
  final String urlImagem;
  final String descricao;

  Pokemon({
    required this.numero,
    required this.nome,
    required this.tipo,
    required this.nivel,
    required this.hpAtual,
    required this.hpMaximo,
    required this.capturado,
    this.favorito = false, // Começa como falso por padrão
    required this.urlImagem,
    required this.descricao,
  });
}

// QUESTÃO 7: Lista fake contendo os iniciais, Pikachu e lendários (Mínimo 12)
List<Pokemon> pokemonsFake = [
  // --- 1ª GERAÇÃO ---
  Pokemon(
    numero: 1,
    nome: 'Bulbasaur',
    tipo: 'Planta',
    nivel: 5,
    hpAtual: 20,
    hpMaximo: 20,
    capturado: true,
    urlImagem: 'https://img.pokemondb.net/artwork/large/bulbasaur.jpg',
    descricao: 'Há uma semente de planta em suas costas desde o dia em que o Pokémon nasce. A semente cresce lentamente.',
  ),
  Pokemon(
    numero: 4,
    nome: 'Charmander',
    tipo: 'Fogo',
    nivel: 5,
    hpAtual: 18,
    hpMaximo: 18,
    capturado: true,
    urlImagem: 'https://img.pokemondb.net/artwork/large/charmander.jpg',
    descricao: 'A chama em sua cauda indica o poder de seu fogo interno. Se ela se apagar, o Pokémon morre.',
  ),
  Pokemon(
    numero: 7,
    nome: 'Squirtle',
    tipo: 'Água',
    nivel: 5,
    hpAtual: 22,
    hpMaximo: 22,
    capturado: true,
    urlImagem: 'https://img.pokemondb.net/artwork/large/squirtle.jpg',
    descricao: 'Quando retrai seu longo pescoço para dentro de sua concha, ele dispara água com uma força incrível.',
  ),

  // --- 2ª GERAÇÃO ---
  Pokemon(
    numero: 152,
    nome: 'Chikorita',
    tipo: 'Planta',
    nivel: 6,
    hpAtual: 22,
    hpMaximo: 22,
    capturado: true,
    urlImagem: 'https://img.pokemondb.net/artwork/large/chikorita.jpg',
    descricao: 'Usa a folha em sua cabeça para determinar a temperatura e a umidade do ambiente ao seu redor.',
  ),
  Pokemon(
    numero: 155,
    nome: 'Cyndaquil',
    tipo: 'Fogo',
    nivel: 5,
    hpAtual: 19,
    hpMaximo: 19,
    capturado: true,
    urlImagem: 'https://img.pokemondb.net/artwork/large/cyndaquil.jpg',
    descricao: 'Costuma ser tímido e se enrolar como uma bola. Se for atacado, acende as chamas em suas costas.',
  ),
  Pokemon(
    numero: 158,
    nome: 'Totodile',
    tipo: 'Água',
    nivel: 7,
    hpAtual: 24,
    hpMaximo: 24,
    capturado: true,
    urlImagem: 'https://img.pokemondb.net/artwork/large/totodile.jpg',
    descricao: 'Pequeno, mas violento. Ele morde qualquer coisa que se mova diante de seus olhos.',
  ),

  // --- 3ª GERAÇÃO ---
  Pokemon(
    numero: 252,
    nome: 'Treecko',
    tipo: 'Planta',
    nivel: 5,
    hpAtual: 21,
    hpMaximo: 21,
    capturado: true,
    urlImagem: 'https://img.pokemondb.net/artwork/large/treecko.jpg',
    descricao: 'Possui pequenos ganchos na sola dos pés que o permitem andar verticalmente por paredes e tetos.',
  ),
  Pokemon(
    numero: 255,
    nome: 'Torchic',
    tipo: 'Fogo',
    nivel: 5,
    hpAtual: 20,
    hpMaximo: 20,
    capturado: true,
    urlImagem: 'https://img.pokemondb.net/artwork/large/torchic.jpg',
    descricao: 'Dentro de seu corpo há uma bolsa de fogo que queima sem parar. É quente como um abraço.',
  ),
  Pokemon(
    numero: 258,
    nome: 'Mudkip',
    tipo: 'Água',
    nivel: 5,
    hpAtual: 23,
    hpMaximo: 23,
    capturado: true,
    urlImagem: 'https://img.pokemondb.net/artwork/large/mudkip.jpg',
    descricao: 'A barbatana em sua cabeça funciona como um radar altamente sensível para detectar correntes de ar e água.',
  ),

  // --- ESPECIAIS E LENDÁRIOS ---
  Pokemon(
    numero: 25,
    nome: 'Pikachu',
    tipo: 'Elétrico',
    nivel: 12,
    hpAtual: 35,
    hpMaximo: 35,
    capturado: true,
    urlImagem: 'https://img.pokemondb.net/artwork/large/pikachu.jpg',
    descricao: 'Armazena eletricidade em suas bochechas vermelhas. Quando fica bravo, descarrega energia instantaneamente.',
  ),
  Pokemon(
    numero: 151,
    nome: 'Mew',
    tipo: 'Psíquico',
    nivel: 50,
    hpAtual: 160,
    hpMaximo: 160,
    capturado: false,
    urlImagem: 'https://img.pokemondb.net/artwork/large/mew.jpg',
    descricao: 'Diz-se que possui o mapa genético de todos os Pokémons existentes. Consegue ficar invisível à vontade.',
  ),
  Pokemon(
    numero: 150,
    nome: 'Mewtwo',
    tipo: 'Psíquico',
    nivel: 70,
    hpAtual: 220,
    hpMaximo: 220,
    capturado: false,
    urlImagem: 'https://img.pokemondb.net/artwork/large/mewtwo.jpg',
    descricao: 'Um Pokémon criado por manipulação genética em laboratório. Seus poderes psíquicos são implacáveis.',
  ),
];