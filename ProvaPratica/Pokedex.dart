import 'Pokemon.dart';
 
// - Criação da classe Pokedéx - (Questão 04)
class Pokedex {
  List<Pokemon> _pokemons = []; // - O List<Pokemon> indica que a lista só aceita objetos do tipo Pokemon
 
 
  // - Método adicionarPokemon(Pokemon p) - (Questão 04)
  void  adicionarPokemon(Pokemon p) {
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

  // - Listar pokemons com nível acima do mínimo digitado
  List<Pokemon> listarAcimaDoNivel(int nivelMinimo) {
    List<Pokemon> resultado = [];
    for (int i = 0; i < _pokemons.length; i++) {
      if (_pokemons[i].nivel > nivelMinimo) { // - se o Pokemon tiver nivel maior do que o digitado, é colocado na lista tbm
        resultado.add(_pokemons[i]);
      }
    }
    return resultado;
  }

  // - Listar pokemons que podem evoluir 
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
}
