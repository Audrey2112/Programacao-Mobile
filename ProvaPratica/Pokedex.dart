import 'Pokemon.dart';
 
// - Criação da classe Pokedéx - (Questão 04)
class Pokedex {
  List<Pokemon> _pokemons = []; // - O List<Pokemon> indica que a lista só aceita objetos do tipo Pokemon

  // - Getter necessário para conseguir acessar os pokemons de fora da classe, pq ali em cima esse _pokemons foi criado como sendo privado - (Questão 10)
  List<Pokemon> get todos => _pokemons; // - => significa retorno
 
  // - Método adicionarPokemon(Pokemon p) - (Questão 04)
  void adicionarPokemon(Pokemon p) {
    for (int i = 0; i < _pokemons.length; i++) {  // - O length retorna o número de elementos que a lista tem naquele momento
      if (_pokemons[i].numero == p.numero) {
        print('Erro. O Pokemon ${p.nome} (numero ${p.numero}) já existe nesta POkedéx!');
        return;
      }
    }
 
    _pokemons.add(p);
    print('O Pokemon ${p.nome} de número ${p.numero} foi adicionado a Pokedéx :)');
  }
 
  // - Método removerPokemonPorNumero(int numero) - (Questão 04)
  void removerPokemonPorNumero(int numero) {
    int tamanhoAntes = _pokemons.length;
    _pokemons.removeWhere((p) => p.numero == numero);
 
    if(_pokemons.length < tamanhoAntes) {
      print('Pokemon de número $numero foi removido da Pokedéx');
      } else {
      print('Pokemon de numero $numero não foi removido da Pokedéx');
    }
  }
 
  // - Método buscarPorNumero(int numero) - (Questão 04)
  // - O que define a busca seria o símbolo de ?, no caso de Buscar Pokemon, usaríamos o Pokemon?
  Pokemon? buscarPorNumero(int numero) {
    for (int i = 0; i < _pokemons.length; i ++){
      if (_pokemons[i].numero == numero) {
        return _pokemons[i]; // - Se ele encontrar,vai realizar o retorno
      }
    }
    return null; // - Se ele não encontrar, vai retornar nulo
 
  }
   
  // - Método listarTodos() - (Questão 04)
  void listarTodos() {
    if (_pokemons.isEmpty) {
      print('A Pokedéx está vazia no momento :(');
      return;
    }
 
    print('\n------------------------------------------------------------------');
    print('Lista de Todos os Pokemons da Pokedéx:');
    for (int i = 0; i < _pokemons.length; i++) {
      _pokemons[i].exibirFicha();
    }
  }

  // - Listar Pokemons capturados - (Questão 05) 
  List<Pokemon> listarCapturados() {
    List<Pokemon> resultado = []; // - o retorno vai ser um []
    for (int i = 0; i < _pokemons.length; i++) { // - Aqui olha de Pokemon por pokemon, de 1 por 1
      if (_pokemons[i].capturado) {
        resultado.add(_pokemons[i]); // - Se o Pokemon foi capturado (true), coloca ele dentro da lista []
      }
    }
    return resultado;
  }

  // - Listar por tipo - Deve ignorar letras maiúsculas/minúsculas - (Questão 05)
  List<Pokemon> listarPorTipo(String tipo) {
    List<Pokemon> resultado = [];
    for (int i = 0; i < _pokemons.length; i++) {
      if (_pokemons[i].tipo.toLowerCase() == tipo.toLowerCase()) { // - aqui o responsável por ignorar se está escrito em maiusculo ou minusculo é o toLowercase (vai transformar tudo em minusculo)
        resultado.add(_pokemons[i]);
      }
    }
    return resultado;
  }

  // - Listar pokemons com nível acima do mínimo digitado - (Questão 05)
  List<Pokemon> listarAcimaDoNivel(int nivelMinimo) {
    List<Pokemon> resultado = [];
    for (int i = 0; i < _pokemons.length; i++) {
      if (_pokemons[i].nivel > nivelMinimo) { // - se o Pokemon tiver nivel maior do que o digitado, é colocado na lista tbm
        resultado.add(_pokemons[i]);
      }
    }
    return resultado;
  }

  // - Listar pokemons que podem evoluir - (Questão 05)
  // - Condição: tem próxima evolução definida e tbm já atingiu o nível necessário
  List<Pokemon> listarQuePodemEvoluir() {
    List<Pokemon> resultado = [];
    for (int i = 0; i < _pokemons.length; i++) {
      if (_pokemons[i].proximaEvolucao != null && _pokemons[i].nivel >= _pokemons[i].nivelEvolucao) { // Ambas as coisas devem ocorrer para o pokemon se listado, deve possuir uma evolução (não pode ser nulo) E tbm deve possuir nivel necessrrio
        resultado.add(_pokemons[i]);
      }
    }
    return resultado;
  }
  
  
  // - Estatísticas da Pokédex - (Questão 11)
  int totalPokemons() { // - vai retornar o total de pokemons que foram criados
    return _pokemons.length;
  }
  
  // - quantidadePorTipo() deve agrupar corretamente os pokémons por tipo - (Questao 11)
  Map<String, int> quantidadePorTipo() { // - Map<String, int> é como uma agenda, de um lado fica o tipo (String) e do outro a quantidade (int)
    Map<String, int> resultado = {}; // - começa com a agenda vazia {}
   
    for(int i = 0; i < _pokemons.length; i++) {
      String tipo = _pokemons[i].tipo;
      if(resultado.containsKey(tipo)) { // - containsKey verifica se esse tipo já existe na agenda
        resultado[tipo] = resultado[tipo]! + 1;
      } else {
        resultado[tipo] = 1;
      }
    }
    return resultado;
  }
  
  // - double mediaDeNivel() -> deve retornar valor decimal - (Questao 11)
  double mediaDeNivel() {
    if(_pokemons.isEmpty) { // - se a Pokédex estiver vazia, os métodos numéricos devem retornar 0 sem erro.
      return 0;
    }
    int soma = 0;
    for(int i = 0; i < _pokemons.length; i++) {
      soma = soma + _pokemons[i].nivel; // - vai acumulando a soma dos níveis
    }
    return soma / _pokemons.length; // - basicamente, divide a soma total pela quantidade de pokemons = média
  }
  
  // - double percentualCapturados() -> percentualCapturados() deve retornar percentual entre 0 e 100 - (Questão 11)
  double percentualCapturados() {
    if(_pokemons.isEmpty) {
      return 0;
    }
    
    int capturados = 0;
    for(int i = 0; i < _pokemons.length; i++) {
      if(_pokemons[i]. capturado) { // - se o pokemon foi capturado (true), add + 1
        capturados = capturados + 1;
      }
    }
   return (capturados / _pokemons.length) * 100; // - percentual se multiplica por 100
  }
  
  // - Exibir Estatística: vai exibir as estatisticas dos Pokemons de forma organizada, assim como o exibir ficha - (Questão 11)
  void exibirEstatistica() {
    print('---------------------------------------------------------------------------');
    print('\n--- Estatisticas dos Pokemons da Pokedex: ---');
    print('\nTotal de Pokemons cadastrados: ${totalPokemons()}');
    print('\nQuantidade de Pokemons por tipo: ');
    Map<String, int> porTipo = quantidadePorTipo(); // - guarda o resultado da agenda em uma variável
    porTipo.forEach((tipo, quantidade) { // - esse forEach percorre cada item da agenda e devolve dps
      print('-> $tipo: $quantidade');
    });
    print('\nMédia do Nível dos Pokemons: ${mediaDeNivel().toStringAsFixed(1)}'); // - toStringAsFixed(1) serve para mostrar só 1 casa decimal
    print('\nPercentual de Pokemons capturados = ${percentualCapturados().toStringAsFixed(1)}%'); 
  }
}
