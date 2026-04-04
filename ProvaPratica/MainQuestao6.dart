import 'Pokemon.dart';

void main() {
  PokemonFogo pokemon1 = PokemonFogo(004, 'Charmeleon', 20, 280, 410, true);
  PokemonAgua pokemon2 = PokemonAgua(007, 'Squirtle', 20, 270, 292, false);
  PokemonEletrico pokemon3 = PokemonEletrico(025, 'Pikachu', 20, 230, 274, true);

  print('Fichas dos Pokemons antes dos Ataques:');
  pokemon1.exibirFicha(); 
  pokemon2.exibirFicha();
  pokemon3.exibirFicha();

  print('\nComparando os ataques base dos Pokemons - todos estão com o nivel 20:');
  print('${pokemon1.nome}: ${pokemon1.calcularAtaqueBase()} de ataque (nivel ${pokemon1.nivel} * 3)');   // - Polimorfismo, ou seja, mesma chamada só que resultados diferentes por tipo de Pokemon
  print('${pokemon2.nome}: ${pokemon2.calcularAtaqueBase()} de ataque (nivel ${pokemon2.nivel} * 2 + 10)');
  print('${pokemon3.nome}: ${pokemon3.calcularAtaqueBase()} de ataque (nivel ${pokemon3.nivel} * 2 + 15)');
}
