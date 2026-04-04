import 'Pokemon.dart';
import 'Pokedex.dart';

void main() {
  Pokedex pokedex = Pokedex();

  Pokemon pokemon1 = Pokemon(001, 'Bulbasaur', 'Planta e Veneno', 15, 250, 294, true);
  pokemon1.proximaEvolucao = 'Ivysaur';
  pokemon1.nivelEvolucao = 16; 

  Pokemon pokemon2 = Pokemon(007, 'Squirtle', 'Água', 12, 270, 292, false);

  Pokemon pokemon3 = Pokemon(039, 'Jigglypuff', 'Normal e Fada', 18, 400, 434, true);
  pokemon3.proximaEvolucao = 'Wigglytuff';
  pokemon3.nivelEvolucao = 18; 

  Pokemon pokemon4 = Pokemon(025, 'Pikachu', 'Elétrico', 25, 230, 274, true);
  pokemon4.proximaEvolucao = 'Raichu';
  pokemon4.nivelEvolucao = 20; 

  Pokemon pokemon5 = Pokemon(052, 'Meowth', 'Normal', 15, 260, 284, false);

  pokedex.adicionarPokemon(pokemon1);
  pokedex.adicionarPokemon(pokemon2);
  pokedex.adicionarPokemon(pokemon3);
  pokedex.adicionarPokemon(pokemon4);
  pokedex.adicionarPokemon(pokemon5);

  void mostrarFiltro(String titulo, List<Pokemon> lista) { // - simplificando o metodo de todos os filtros, para nao ficar repetitivo varios print e for
    print('\n------------------------------------------------------------------');
    print('$titulo:');
    if (lista.isEmpty) {  // - se a lista veio vazia, exibe a mensagem abaixo
      print('Nenhum Pokemon encontrado :(');
      return;
    }
    for (int i = 0; i < lista.length; i++) {
      print('  - #${lista[i].numero} ${lista[i].nome} (${lista[i].tipo}) Nv.${lista[i].nivel}'); // - se a lista não veio vazia, vai listar de acordo com numero, nome, tipo e nivel
    }
  }

  mostrarFiltro('Capturados', pokedex.listarCapturados());
  mostrarFiltro('Tipo: Normal e Fada', pokedex.listarPorTipo('normal e fada')); 
  mostrarFiltro('Tipo: NORMAL E FADA', pokedex.listarPorTipo('NORMAL E FADA')); 
  mostrarFiltro('Pokemons acima do nível 15', pokedex.listarAcimaDoNivel(15));
  mostrarFiltro('Pokemons que podem evoluir agora', pokedex.listarQuePodemEvoluir());
}
