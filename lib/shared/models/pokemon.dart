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
  
  // Atributo que controlado pelo Desafio Adicional (StatefulWidget)
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