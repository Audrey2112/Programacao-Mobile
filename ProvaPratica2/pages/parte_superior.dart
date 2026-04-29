import 'package:flutter/material.dart'; // importa widgets visuais
 
class ParteSuperior extends StatelessWidget {
  const ParteSuperior({super.key});
 
  @override
  Widget build(BuildContext context) {
    return Padding( // espaçamento ao redor do conteúdo
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Stack( // sobrepõe widgets em camadas
        alignment: Alignment.center, // alinha as camadas ao centro por padrão
        children: [
          Align( // posiciona a foto à esquerda dentro do Stack
            alignment: Alignment.centerLeft,
            child: CircleAvatar( // Colocando a foto de perfil ali como circular
              radius: 18, // tamanho do círculo
              backgroundImage: NetworkImage( // carrega a foto de perfil pela URL
                'https://tse1.explicit.bing.net/th/id/OIP.JMrj-qHhIaF0dTkiMQSbqgHaI8?pid=ImgDet&w=207&h=249&c=7&o=7&rm=3%27',
              ),
            ),
          ),
          Image.network( // logo oficial do X (Twitter)
            'https://th.bing.com/th/id/OIP.lGfchnm975HQSYRAyLgt_wAAAA?w=214&h=214&c=7&r=0&o=7&pid=1.7&rm=3',
            width: 32,
            height: 32,
          ),
        ],
      ),
    );
  }
}
 
class VcSeg extends StatelessWidget { // widget das abas "Para você" e "Seguindo"
  const VcSeg({super.key});
 
  @override // sobreescrita
  Widget build(BuildContext context) {
    return Column( // empilha a Row das abas e o divisor
      children: [
        Row( // coloca as duas abas lado a lado
          children: [
            Expanded( // metade metade
              child: Column( // empilha o texto e a linha azul verticalmente
                children: [
                  const Padding( // espaçamento ao redor do texto da aba
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      'Para você',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black), // negrito = aba ativa
                    ),
                  ),
                  Container( // colocando o azulzinho no para voce
                    height: 3,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1D9BF0), // cor azul
                      borderRadius: BorderRadius.circular(2), // bordas arredondadas da linha
                    ),
                  ),
                ],
              ),
            ),
            Expanded( // metade metade
              child: Column( // empilha o texto e o espaço transparente
                children: [
                  const Padding( // espaçamento ao redor do texto da aba
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      'Seguindo',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.grey), // cinza do "Seguindo"
                    ),
                  ),
                  Container(height: 3, color: Colors.transparent), // espaço transparente (sem linha azul)
                ],
              ),
            ),
          ],
        ),
        const Divider(height: 1, color: Color(0xFFE6E6E6)), // linha divisória cinza abaixo das abas
      ],
    );
  }
}
 
