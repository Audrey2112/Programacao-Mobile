import 'Pokemon.dart';
import 'Habilidade.dart';

void main() {
  PokemonFogo pokemon1 = PokemonFogo(004, 'Charmander', 16, 280, 390, true);
  PokemonAgua pokemon2 = PokemonAgua(007, 'Squirtle', 12, 270, 292, false);
  PokemonEletrico pokemon3 = PokemonEletrico(025, 'Pikachu', 25, 230, 274, true);

  ChoqueDoTrovao choque = ChoqueDoTrovao();
  Lancachamas chamas = Lancachamas();
  JatoDAgua jato = JatoDAgua();

  // - Exigência: No main(), simule pelo menos 3 turnos de batalha entre pokémons diferentes: 
  print('BATALHA DOS POKEMONS, VAI!!!!!');
  // - Turno 1:
  batalhaPokemon(pokemon1, pokemon2, chamas);

  // - Turno 2: 
  batalhaPokemon(pokemon2, pokemon3, jato);

  // - Turno 3: 
  batalhaPokemon(pokemon3, pokemon1, choque);

  print('\nFim da batalha entre Pokemons, QUE EMOCIONANTE OS POKEMONS E SUAS HABILIDADES!!!');
}
