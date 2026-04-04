import 'Pokemon.dart';
import 'Pokedex.dart';
 
void main() {
  Pokedex pokedex = Pokedex();
 
  Pokemon pokemon1 = Pokemon(001, 'Bulbasaur', 'Planta e Veneno', 15, 250, 294, true);
  Pokemon pokemon2 = Pokemon(007, 'Squirtle', 'Água', 12, 270, 292, false);
  Pokemon pokemon3 = Pokemon(039, 'Jigglypuff ', 'Normal e Fada', 18, 400, 434, true);
  Pokemon pokemon4 = Pokemon(025, 'Pikachu', 'Elétrico', 25, 230, 274, true);
  Pokemon pokemon5 = Pokemon(052, 'Meowth ', 'Normal', 15, 260, 284, false);
 
  // - Adicionar Pokemons:
  print('\n------------------------------------------------------------------');
  pokedex.adicionarPokemon(pokemon1);
  pokedex.adicionarPokemon(pokemon2);
  pokedex.adicionarPokemon(pokemon3);
  pokedex.adicionarPokemon(pokemon4);
  pokedex.adicionarPokemon(pokemon5);
 
  // - Tentativa de adicionar Pokemon repetido
  print('\n------------------------------------------------------------------');
  pokedex.adicionarPokemon(Pokemon(004, 'Charmander', 'Fogo', 15, 280, 282, true));
 
  pokedex.listarTodos();
 
  // - Buscar por Número
  print('\n------------------------------------------------------------------');
  Pokemon? encontrado = pokedex.buscarPorNumero(025); // - Pikachu
  if (encontrado != null) {
    print('Pokémon encontrado: ${encontrado.nome}');
    } else {
    print('Pokémon não encontrado.');
  }
 
  Pokemon? naoEncontrado = pokedex.buscarPorNumero(172); // -> Pichu
  if (naoEncontrado != null) {
    print('Pokémon encontrado: ${naoEncontrado.nome}');
    } else {
    print('Pokémon não encontrado na Pokédex');
  }
 
  // - Remover Pokemons
  print('\n------------------------------------------------------------------');
  pokedex.removerPokemonPorNumero(004);  // - Existe
  pokedex.removerPokemonPorNumero(999);  // - Não existe
 
  pokedex.listarTodos();
}
