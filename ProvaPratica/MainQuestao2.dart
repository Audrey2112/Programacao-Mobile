import 'Pokemon.dart';
 
void main() {
  Pokemon pokemon1 = Pokemon(004, 'Charmander','Fogo', 15, 280, 282, true);
  Pokemon pokemon2 = Pokemon(778, 'Mimikyu','Fastasma e Fada', 20, 220, 314, false);
  Pokemon pokemon3 = Pokemon(151, 'Mew','Psíquico', 10, 390, 404, true);
 
  print('\n------------------------------------------------------------------');
  pokemon1.subirNivel(5);      
  pokemon1.receberDano(15);    
  pokemon1.curar(10);                             
  pokemon1.exibirFicha();
 
  print('\n------------------------------------------------------------------');
  pokemon2.subirNivel(1);    
  pokemon2.receberDano(120);  
  pokemon2.curar(100);          
  pokemon2.subirNivel(4);      
  pokemon2.exibirFicha();
 
  print('\n------------------------------------------------------------------');
  pokemon3.subirNivel(15);    
  pokemon3.receberDano(50);  
  pokemon3.curar(65);              
  pokemon3.exibirFicha();
}
 
