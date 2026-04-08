import 'Pokemon.dart';
import 'Pokedex.dart';
import 'Habilidade.dart';

void main() {
  print('Pokedex: DESAFIO FINAL!!!!');
  Pokedex pokedex = Pokedex();
  
  // - 1. Cadastrar pelo menos 8 pokémons -> ter pokémons de pelo menos 3 tipos diferentes 
  print('\n--------------------------------------------------------------------------------------------');
  print('1. Cadastro dos Pokemons: ');

  Pokemon pokemon1 = Pokemon(001, 'Bulbasaur', 'Planta e Veneno', 15, 250, 294, true);
  pokemon1.proximaEvolucao = 'Ivysaur';
  pokemon1.nivelEvolucao = 16;

  Pokemon pokemon2 = Pokemon(004, 'Charmander', 'Fogo', 16, 280, 390, true);
  pokemon2.proximaEvolucao = 'Charmeleon';
  pokemon2.nivelEvolucao = 16;

  PokemonAgua pokemon3 = PokemonAgua(007, 'Squirtle', 20, 270, 292, false);

  PokemonEletrico pokemon4 = PokemonEletrico(025, 'Pikachu', 20, 230, 274, true);

  PokemonFogo pokemon5 = PokemonFogo(058, 'Growlithe', 20, 300, 314, true);

  Pokemon pokemon6 = Pokemon(032, 'Nidoran', 'Veneno', 15, 280, 296, false);

  Pokemon pokemon7 = Pokemon(1002, 'Chien-Pao', 'Gelo e Escuro', 25, 364, 364, false);

  Pokemon pokemon8 = Pokemon(039, 'Jigglypuff', 'Normal e Fada', 18, 400, 434, true);

  pokedex.adicionarPokemon(pokemon1);
  pokedex.adicionarPokemon(pokemon2);
  pokedex.adicionarPokemon(pokemon3);
  pokedex.adicionarPokemon(pokemon4);
  pokedex.adicionarPokemon(pokemon5);
  pokedex.adicionarPokemon(pokemon6);
  pokedex.adicionarPokemon(pokemon7);
  pokedex.adicionarPokemon(pokemon8);

  
  // 2. Marcar alguns como vistos e capturados
  print('\n--------------------------------------------------------------------------------------------');
  print('2. Marcando os Pokemons como capturados e vistos: ');

  // - Marcar os Pokemons que ainda não foram capturados com vistos 
  pokemon3.marcarComoVisto();
  pokemon6.marcarComoVisto();
  pokemon7.marcarComoVisto();

  // - Marcar os Pokemons como capturados (tbm mrca eles como vistos)
  pokemon1.marcarComoCapturado();
  pokemon2.marcarComoCapturado();
  pokemon4.marcarComoCapturado();
  pokemon5.marcarComoCapturado();
  pokemon8.marcarComoCapturado();
  
  
  // 3. Favoritar pelo menos 2 Pokemons
  print('\n--------------------------------------------------------------------------------------------');
  print('3. Favoritando Pokemons:');
  pokemon1.favoritar();
  pokemon4.favoritar();
  
  
  // - 4. Aplicar todos os filtros da questão 5
  print('\n--------------------------------------------------------------------------------------------');
  print('4. Filtros sendo utilizados nos Pokemons:');

  // - Função auxiliar criada para exibir os resultados dos filtros de forma organizada -> MainQuestao5
  void mostrarFiltro(String titulo, List<Pokemon> lista) {
    print('\n--- $titulo ---');
    if (lista.isEmpty) {
      print('Nenhum Pokemon encontrado :(.');
      return;
    }
    for (int i = 0; i < lista.length; i++) {
      print('  - ${lista[i].numero} ${lista[i].nome} (${lista[i].tipo}) Nível: ${lista[i].nivel}');
    }
  }

  mostrarFiltro('Capturados', pokedex.listarCapturados());
  mostrarFiltro('Tipo: Veneno', pokedex.listarPorTipo('veneno'));
  mostrarFiltro('Acima do nível 15', pokedex.listarAcimaDoNivel(15));
  mostrarFiltro('Podem evoluir agora', pokedex.listarQuePodemEvoluir()); 
  
  
  // 5. Realizar pelo menos 1 evolução
  print('\n--------------------------------------------------------------------------------------------');
  print('5. Evoluindo Pokemons: ');

  print('-> Evoluindo o Pokemon ${pokemon1.nome} (nível: ${pokemon1.nivel}):');
  pokemon1.evoluir();

  print('\n-> Evoluindo o Pokemon ${pokemon2.nome} (nível: ${pokemon2.nivel}):');
  pokemon2.evoluir();


  // - 6. Simular pelo menos 2 batalhas com habilidades
  print('\n--------------------------------------------------------------------------------------------');
  print('6. BATALHA DOS POKEMONS USANDO SUAS HABILIDADES!!!: ');

  ChoqueDoTrovao choque = ChoqueDoTrovao();
  JatoDAgua jato = JatoDAgua();
  Lancachamas chamas = Lancachamas();

  // - Batalha 1: 
  print('\nBatalha 1: COMECEM!!!');
  batalhaPokemon(pokemon4, pokemon6, choque);
  batalhaPokemon(pokemon4, pokemon6, choque);

  // - Batalha 2:
  print('\n--------------------------------------------------------------------------------------------');
  print('\nBatalha 2: VAI!!!');
  batalhaPokemon(pokemon5, pokemon3, chamas);
  batalhaPokemon(pokemon3, pokemon5, jato);
  batalhaPokemon(pokemon5, pokemon3, chamas);


  // - 7. Exibir as estatísticas finais da Pokédex
  print('\n--------------------------------------------------------------------------------------------');
  print('7. Estatítica final dos POkemons na Pokedex: ');
  pokedex.exibirEstatistica();
}
