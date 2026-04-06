/*
Questão 01 - Cadastro básico de Pokémon
Questão 02 - Encapsulamento e validação de regras
Questão 03 - Evolução com regra fixa
Questão 06 - Herança por tipo de Pokémon
Questão 07 - Habilidades com classe abstrata
Questão 08 - Polimorfismo em batalha
Questão 09 - Interface de registro da Pokédex
*/

// - Criação da Interface de registro da Pokédex - (Questão 09)
abstract interface class RegistravelNaPokedex { 
  void marcarComoVisto();
  void marcarComoCapturado(); 
  void favoritar(); 
  void desfavoritar();
}

// - Criação da Classe Pokemon e abaixo, seus atributos (Questão 01)
// - com _ na frente, os atributos se tornam privados (Questão 02 - encapsulamento)
class Pokemon implements RegistravelNaPokedex { 
  int _numero = 0;
  String _nome = ' ';
  String _tipo = ' ';
  int _nivel = 0;
  int _hpAtual = 0;
  int _hpMaximo = 0;
  bool _capturado = false; 

  // - Atributos de evolução (Questão 03)
  String? proximaEvolucao;
  int nivelEvolucao = 0;

  // - Atributo da classe abstrata e concreta - (Questão 07)
  int energia = 100;

  // - Atributos da Interface criada - (Questão 09)
  bool _visto = false;
  bool _favorito = false; 

  // - Construtor: inicializar o objeto (Questão 01)
  Pokemon (int numero, String nome, String tipo, int nivel, int hpAtual, int hpMaximo, bool capturado) {
    _numero = numero;
    _nome = nome;
    _tipo = tipo;
    _nivel = nivel;
    _hpAtual = hpAtual;
    _hpMaximo = hpMaximo;
    _capturado = capturado;

    // - 1° Restrição: nivel deve começar entre 1 e 100
    if (nivel < 1|| nivel > 100) {
      print ('Erro. O nível do Pokemon $nome deve começar entre 1 e 100. Valor recebido: $nivel');
    }

    // - 2° Restrição: hpAtual não pode ser maior que hpMaximo
    if (hpAtual > hpMaximo) {
      print ('Erro. O Hp Atual ($hpAtual) do Pokemon $nome não pode ser maior do que o Hp Máximo ($hpMaximo)');
    }

    // - 3° Restrição: hpMaximo deve ser maior que 0
    if (hpMaximo <= 0) {
      print ('Erro. O Hp Máximo do Pokemon $nome deve ser maior do que 0. Valor recebido: $hpMaximo');
    }
  }

  // Getters: vai conseguir permitir a leitura dos valores fora da classe - (Questão 02)
  int get numero => _numero;
  String get nome => _nome;
  String get tipo => _tipo;
  int get nivel => _nivel;
  int get hpAtual => _hpAtual;
  int get hpMaximo => _hpMaximo;
  bool get capturado => _capturado;

  // - getter para os atributos da Interface - (Questão 09)
  bool get visto => _visto;
  bool get favorito => _favorito;

  // - MÉTODOS: definem as ações que os objetos realizam
  // - Método exibirFicha() - (Questão 1):
  void exibirFicha() {
    print ('Numero: $_numero');
    print ('Nome: $_nome');
    print ('Tipo: $_tipo');
    print ('Nível: $_nivel');
    print ('Hp Atual: $_hpAtual');
    print ('Hp Máximo: $_hpMaximo');
    print ('Capturado: $_capturado');

    // - Da Questão 07:
    print('Energia: $energia');
    
    // - Da Questão 03: 
    if (proximaEvolucao != null){
      print('Próxima Evolução: $proximaEvolucao (Nível: $nivelEvolucao)');
    }
    print('\n--------------------------------------------------------');
  }

  // - Com atributos sendo privados (_), só esses métodos podem modificá-los
  // - Método subirNivel(int quantidade) - (Questão 02)
  void subirNivel(int quantidade) {
    if (quantidade <= 0) {
      print('Quantidade inválida para subir de nível o Pokemon $nome, a quantidade deve ser maior do que 0');
      return;
    }
    _nivel = _nivel + quantidade;

    if (_nivel > 100) {
      _nivel = 100; // - Impedir que o nível passe de 100
    }

    print('O Pokemon $nome subiu para o nível: $_nivel!!!!!');
  }

  // - Método receberDano(int dano) - (Questão 02)
  void receberDano(int dano) {
    if (dano <= 0) {
      print('Valor inválido de dano para o Pokemon $nome, o dano recebido deve ser maior do que 0');
      return;
    }
    _hpAtual = _hpAtual - dano;

    if (_hpAtual < 0) {
      _hpAtual = 0; // - Impedir que o Hp fique negativo
    }

    print('O Pokemon $nome recebeu $dano de dano. Seu Hp atual é de: $_hpAtual/$_hpMaximo'); 
  }

  // - Método curar(int valor) - (Questão 02)
  void curar(int valor) {
    if (valor <= 0){
      print('Valor inválido de cura para o Pokemon $nome. O valor da cura deve ser maior do que 0');
      return;
    }
    _hpAtual = _hpAtual + valor;

    if (_hpAtual > _hpMaximo) {
      _hpAtual = _hpMaximo;
    }

    print('O Pokemon $nome curou $valor de Hp. Seu Hp atual é de: $_hpAtual/$_hpMaximo');
  }

  // - Método evoluir() - (Questão 03)
  void evoluir() {
    if (proximaEvolucao == null) {
      print ('O Pokemon $nome não possui uma próxima evolução - Pobre $nome :(');
      return;
    }

    if (_nivel < nivelEvolucao) {
      print('O Pokemon $nome não pode evoluir ainda. O nível necessário para isso é de: $nivelEvolucao / Seu Nível Atual é de: $_nivel');
      return;
    }

    String nomeAnterior = _nome; // - vai guardar o nome atual do Pokemon em uma variável
    _nome = proximaEvolucao!; // - aqui ele muda o nome atual pelo nome da proxima evolução
    proximaEvolucao = null; // - vai apagar a evolução após o seu uso. Só no caso de já ter sido evoluído, daí fica como null
    _hpMaximo = _hpMaximo + 20;
    _hpAtual = _hpMaximo;

    print('O Pokemon $nomeAnterior evoluiu para: $_nome! Seu novo Hp Máximo é de: $_hpMaximo');
  }

  // - Método de calcularAtaqueBase() que vai ser sobrescrito - (Questão 06)
  int calcularAtaqueBase() {
    return _nivel * 2; // - Valor padrão 
  }

  // - Método gastarEnergia() - (Questão 07)
  void gastarEnergia(int custo) {
    energia = energia - custo;
    if (energia < 0) {
      energia = 0;
    }
  }

  // - Métodos da interface RegistravelNaPokedex - (Questão 09)
  @override
  void marcarComoVisto() {
    _visto = true;
    print('O Pokemon $_nome foi marcado como visto');
  }

  @override
  void marcarComoCapturado() {
    _capturado = true;
    _visto = true;
    print('O Pokemon $_nome foi marcado como capturado');
  }

  @override
  void favoritar() {
    if (!_capturado) {
      print('Erro. Não é possível favoritar o Pokemon $_nome, pois ele ainda não foi capturado :(');
      return;
    }
    _favorito = true;
    print('O Pokemon $_nome foi favoritado!! :)');
  }

  @override
  void desfavoritar() {
    _favorito = false;
    print('O Pokemon $_nome foi removido dos favoritos :(');
  }
}

// - Herança por tipo de Pokémon - (Questão 06)
class PokemonFogo extends Pokemon {
  PokemonFogo(int numero, String nome, int nivel, int hpAtual, int hpMaximo, bool capturado)
  : super(numero, nome, 'Fogo', nivel, hpAtual, hpMaximo, capturado);

  @override
  int calcularAtaqueBase() {
    return nivel * 3;
  }

  @override
  void exibirFicha() {
    print('-------------------Pokemon do tipo Fogo-------------------');
    super.exibirFicha();
  }
}

class PokemonAgua extends Pokemon {
  PokemonAgua(int numero, String nome, int nivel, int hpAtual, int hpMaximo, bool capturado)
  : super(numero, nome, 'Água', nivel, hpAtual, hpMaximo, capturado);

  @override
  int calcularAtaqueBase() {
    return nivel * 2 + 10;
  }

  @override
  void exibirFicha() {
    print('-------------------Pokemon do tipo Água-------------------');
    super.exibirFicha();
  }
}

class PokemonEletrico extends Pokemon {
  PokemonEletrico(int numero, String nome, int nivel, int hpAtual, int hpMaximo, bool capturado)
  : super(numero, nome, 'Elétrico', nivel, hpAtual, hpMaximo, capturado);

  @override
  int calcularAtaqueBase() {
    return nivel * 2 + 15;
  }

  @override
  void exibirFicha() {
    print('-------------------Pokemon do tipo Elétrico-------------------');
    super.exibirFicha();
  }
}
