import 'pokemon.dart';
 
void main() {
  Pokemon pokemon1 = Pokemon(004, 'Charmander','Fogo', 15, 280, 282, true);
    pokemon1.exibirFicha();
 
  Pokemon pokemon2 = Pokemon(778, 'Mimikyu','Fastasma e Fada', 20, 220, 314, false);
    pokemon2.exibirFicha();
   
  Pokemon pokemon3 = Pokemon(151, 'Mew','Psíquico', 10, 390, 404, true);
    pokemon3.exibirFicha();  
}
