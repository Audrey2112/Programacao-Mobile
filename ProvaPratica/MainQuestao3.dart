import 'Pokemon.dart';
 
void main() {
  // - Pokemon com nível suficinete para evolução :)
  Pokemon pokemon1 = Pokemon(004, 'Charmander', 'Fogo', 16, 280, 390, true);
  pokemon1.proximaEvolucao = 'Charmeleon';
  pokemon1.nivelEvolucao = 16;
 
  // - Pokemon sem evolução - pobre Mimikyu :(
  Pokemon pokemon2 = Pokemon(778, 'Mimikyu','Fastasma e Fada', 20, 220, 314, false);
 
  // - Pokemon qua não possui nível suficinete para poder evoluir
  Pokemon pokemon3 = Pokemon(151, 'Mew','Psíquico', 10, 390, 404, true);
  pokemon3.proximaEvolucao = 'MewTwo';
  pokemon3.nivelEvolucao = 15;
 
  pokemon1.exibirFicha();
  pokemon2.exibirFicha();
  pokemon3.exibirFicha();
 
  print('\n------------------------------------------------------------------');
  pokemon1.evoluir();
  pokemon2.evoluir();
  pokemon3.evoluir();
 
  print('\n------------------------------------------------------------------');
  pokemon1.exibirFicha();
  pokemon2.exibirFicha();
  pokemon3.exibirFicha();
}
