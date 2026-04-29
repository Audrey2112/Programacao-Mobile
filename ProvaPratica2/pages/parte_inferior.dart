import 'package:flutter/material.dart'; // importa widgets visuais
 
class ParteInferior extends StatelessWidget { // herdando
  const ParteInferior({super.key}); // chamando classe pai
 
  @override
  Widget build(BuildContext context) {
    return Container( // caixa que envolve toda a barra inferior
      decoration: const BoxDecoration(
        color: Colors.white, // fundo branco
        border: Border(top: BorderSide(color: Color(0xFFE6E6E6), width: 0.5)), // borda cinza no topo da barra
      ),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row( // icones lado a lado
        mainAxisAlignment: MainAxisAlignment.spaceAround, // distribui os ícones igualmente
        children: [ // AQUI, O DART JA TEM OS ICONES COMO PADRÃO, ENTÃO É SÓ EU IR INSTANCIANDO ELES
          const Icon(Icons.home, size: 26, color: Colors.black),
          const Icon(Icons.search, size: 26, color: Colors.black),
          Stack( // sobrepõe o badge em cima da imagem do Grok
            clipBehavior: Clip.none,
            children: [
              Image.network( // carrega a imagem do Grok pela URL
                'https://th.bing.com/th/id/OIP.t9NnNK2tIYsydlMGd7qUqgHaHL?w=183&h=180&c=7&r=0&o=7&pid=1.7&rm=3',
                width: 26,
                height: 26,
              ),
              Positioned( // posiciona o badge em coordenadas exatas
                top: -6,
                right: -8,
                child: Container( // bolinha azul do badge
                  padding: const EdgeInsets.all(3), // espaçamento
                  decoration: const BoxDecoration(
                    color: Color(0xFF1D9BF0),
                    shape: BoxShape.circle, // formato circular
                  ),
                  child: const Text('1', // icone de "1" no icone
                    style: TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          IconNot(icon: Icons.notifications_none, badge: '1'), // icone de "1" no icone
          IconNot(icon: Icons.mail_outline, badge: '1'), // icone de "1" no icone
        ],
      ),
    );
  }
}
 
class IconNot extends StatelessWidget {
  final IconData icon; // recebe qual ícone vai exibir
  final String badge; // recebe o número do badge
 
  const IconNot({required this.icon, required this.badge});
 
  @override // sobreescrita
  Widget build(BuildContext context) {
    return Stack( // sobrepõe o badge em cima do ícone
      clipBehavior: Clip.none, // permite que o badge ultrapasse os limites do Stack
      children: [
        Icon(icon, size: 26, color: Colors.black),
        Positioned(
          top: -6,
          right: -8,
          child: Container(
            padding: const EdgeInsets.all(3), // espaçamento interno
            decoration: const BoxDecoration(
              color: Color(0xFF1D9BF0),
              shape: BoxShape.circle, // formato circular
            ),
            child: Text(
              badge, // número exibido no badge
              style: const TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
 
