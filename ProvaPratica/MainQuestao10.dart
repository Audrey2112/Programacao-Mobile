import 'Pokemon.dart';
import 'Pokedex.dart';

void main() {
  Pokedex pokedex = Pokedex();

  Pokemon pokemon1 = Pokemon(001, 'Bulbasaur', 'Planta e Veneno', 15, 250, 294, true);
  Pokemon pokemon2 = Pokemon(007, 'Squirtle', 'Água', 12, 250, 292, false);
  Pokemon pokemon3 = Pokemon(039, 'Jigglypuff ', 'Normal e Fada', 18, 20, 434, true);
  Pokemon pokemon4 = Pokemon(025, 'Pikachu', 'Elétrico', 25, 230, 274, true);
  Pokemon pokemon5 = Pokemon(052, 'Meowth ', 'Normal', 15, 260, 284, false);

  // - Marcando alguns Pokemons como capturados e tbm favoritando eles
  pokemon1.marcarComoCapturado();
  pokemon1.favoritar();
  pokemon2.marcarComoCapturado();
  pokemon2.favoritar();
  print('\n ');

  pokedex.adicionarPokemon(pokemon1);
  pokedex.adicionarPokemon(pokemon2);
  pokedex.adicionarPokemon(pokemon3);
  pokedex.adicionarPokemon(pokemon4);
  pokedex.adicionarPokemon(pokemon5);

  // - Consulta 1: filtrar pokémons com hpAtual abaixo de 30;
  // - where() vai receber a função anônima (p) => p.hpAtual < 30
  print('\nPokemons que estão com o Hp Atual menor do que 30:');
  List<Pokemon> hpBaixo = pokedex.todos.where((p) => p.hpAtual < 30).toList(); // - Pega a lista de todos os Pokemons prewsentes na Pokedex, percorrendo cada Pokemons da lista retornada e vendo se ele tem hp atual abaixo de 30
  if (hpBaixo.isEmpty) {
    print('Nenhum resultado.');
  }
  for (int i = 0; i < hpBaixo.length; i++) {
    print(' -> ${hpBaixo[i].nome}- Hp: ${hpBaixo[i].hpAtual}/${hpBaixo[i].hpMaximo}');
  }

  // - Consulta 2: ordenar os pokémons por nome em ordem alfabética
  print('\nPokemons em ordem alfabética:');
  List<Pokemon> porNome = List<Pokemon>.from(pokedex.todos);
  porNome.sort((a, b) => a.nome.compareTo(b.nome)); // - o sort() vai ordenar a lista retornada, recebendo 2 pokemons por vez e vai comparando (a compara com b) -> a é maior que b?
  
  for (int i = 0; i < porNome.length; i++) {
    print(' -> ${porNome[i].nome}');
  }

  // - Consulta 3: ordenar os pokémons por nível em ordem decrescente
  // - b antes de a inverte a ordem: do maior para o menor
  print('\nPokemons em ordem de maior para menor nível:');
  List<Pokemon> porNivel = List<Pokemon>.from(pokedex.todos);
  porNivel.sort((a, b) => b.nivel.compareTo(a.nivel)); // - O oposto do de cima, ao invés de considerar o a, considera o b (b compara com a) -> b é maior que a?
  
  for (int i = 0; i < porNivel.length; i++) {
    print(' -> ${porNivel[i].nome}: nível ${porNivel[i].nivel}');
  }

  // - Consulta 4: selecionar apenas os pokémons favoritos
  // - Função anônima (p) => p.favorito 
  print('\nPokemons favoritos: ');
  List<Pokemon> favoritos = pokedex.todos.where((p) => p.favorito).toList(); // - parecido com  a cosulta 1, mas leva em consideração se o Pokemon: favorito = true
  if (favoritos.isEmpty) {
    print('Nenhum favorito.');
  }
  for (int i = 0; i < favoritos.length; i++) {
    print(' -> ${favoritos[i].nome}');
  }
}
