import 'pokemon.dart';
import 'habilidade.dart';

void main() {

  PokemonFogo pokemon1 = PokemonFogo(004, 'Charmander', 16, 280, 390, true);
  pokemon1.energia = 100; 

  PokemonAgua pokemon2 = PokemonAgua(007, 'Squirtle', 12, 270, 292, false);
  pokemon2.energia = 100;

  PokemonEletrico pokemon3 = PokemonEletrico(025, 'Pikachu', 25, 230, 274, true);
  pokemon3.energia = 100;

  // - Instâncias das habilidades concretas: 
  Lancachamas chamas = Lancachamas();
  JatoDAgua jato = JatoDAgua();
  ChoqueDoTrovao choque = ChoqueDoTrovao(); 

  print('Pokemons usando suas habilidades!!!');
  print('\n${pokemon1.nome}(energia: ${pokemon1.energia}) usa a habilidade Lança-Chamas contra o Pokemon ${pokemon2.nome}!!! (custo de 20 energias):');
  choque.usar(pokemon1, pokemon2);   

  print('\n${pokemon2.nome}(energia: ${pokemon2.energia}) usa a habilidade Jato de Água contra o Pokemon ${pokemon3.nome}!!!! (custo de 15 energias):');
  jato.usar(pokemon2, pokemon3);  // - squirtle: 50 → usa → fica com 35

  print('\n${pokemon3.nome} (energia: ${pokemon3.energia}) usa a habilidade Choque do Trovão contra o Pokemon ${pokemon1.nome}!!!!!! (custo de 25 energias):');
  chamas.usar(pokemon3, pokemon1); // - charmander: 30 → usa → fica com 5


  print('\nFichas dos Pokemons após usarem suas habilidades:');
  pokemon1.exibirFicha();
  pokemon2.exibirFicha();
  pokemon3.exibirFicha();
}
