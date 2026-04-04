import 'Pokemon.dart';

// - Criando a classe abstrata Habilidade - usando o "abstract" para isso - (Questão 07)
abstract class Habilidade {
  String nome = ' ';
  int custoEnergia = 0;

  // - Construtor da classe
  Habilidade(String nome, int custoEnergia) {
    this.nome = nome;
    this.custoEnergia = custoEnergia;
  }

  // - Método abstrato da classe, não tem "corpo"
  void usar(Pokemon usuario, Pokemon alvo);
}

// - Criando as classes concretas:
// - ChoqueDoTrovao:
class ChoqueDoTrovao extends Habilidade {
  ChoqueDoTrovao() : super('Choque do Trovão', 20);

  @override // - Sobrescrita do método
  void usar(Pokemon usuario, Pokemon alvo) {
    if (usuario.energia < custoEnergia) {
      print('O Pokemon ${usuario.nome} não possui energia suficiente para usar $nome :(');
      print('A energia atual é de: ${usuario.energia} / O custo é de: $custoEnergia');
      return;
    }
    usuario.gastarEnergia(custoEnergia);
    int dano = usuario.calcularAtaqueBase() + 5;
    alvo.receberDano(dano);
  }
}

// - Classe concreta JatoDAgua
class JatoDAgua extends Habilidade {
  JatoDAgua() : super('Jato de Água', 10);

  @override
  void usar(Pokemon usuario, Pokemon alvo) {
    if (usuario.energia < custoEnergia) {
      print('O Pokemon ${usuario.nome} não possui energia suficiente para usar $nome :(');
      print('A energia atual é de: ${usuario.energia} / O custo é de: $custoEnergia');
      return;
    }
    usuario.gastarEnergia(custoEnergia);
    int dano = usuario.calcularAtaqueBase() + 3;
    alvo.receberDano(dano);
  }
}

// - Classe concreta Lancachamas
class Lancachamas extends Habilidade {
  Lancachamas() : super('Lança Chamas', 15);

  @override
  void usar(Pokemon usuario, Pokemon alvo) {
    if (usuario.energia < custoEnergia) {
      print('O Pokemon ${usuario.nome} não possui energia suficiente para usar $nome :(');
      print('A energia atual é de: ${usuario.energia} / O custo é de: $custoEnergia');
      return;
    }
    usuario.gastarEnergia(custoEnergia);
    int dano = usuario.calcularAtaqueBase() + 7;
    alvo.receberDano(dano);
  }
}

// - Polimorfismo em batalha - (Questão 08)
void batalhaPokemon(Pokemon atacante, Pokemon defensor, Habilidade habilidade) {
  print('-------------------------------------------------------------------');
  print('\n${atacante.nome} usa a habilidade ${habilidade.nome} contra o Pokemon ${defensor.nome}!!!!!');
  habilidade.usar(atacante, defensor); // - aqui ocorre o Polimorfismo: mesmo método usar(), mas com comportamentos diferentes

  if (defensor.hpAtual == 0) { // - verifica se o defensor foi derrotado
    print('O Pokemon ${defensor.nome} foi derrotado pelo ${atacante.nome}!!! QUE BATALHA!!!');
  }
}
