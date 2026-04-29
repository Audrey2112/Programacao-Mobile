import 'package:flutter/material.dart'; // importa widgets visuais
import 'pages/parte_superior.dart'; // importa a parte superior
import 'pages/parte_inferior.dart'; // importa a parte inferior
import 'pages/tweets_card.dart'; // importa os cards de tweet
import 'pages/data/tweets_data.dart'; // importa a lista de tweets
 
void main() => runApp(const MaterialApp( // inicializando
      debugShowCheckedModeBanner: false, // tirando a faixa de debug
      home: TelaTwitter(), // TelaTwitter = estou definindo a tela inicial
    ));
 
class TelaTwitter extends StatelessWidget { // herdando
  const TelaTwitter({super.key}); // chamando classe pai
 
  @override
  Widget build(BuildContext context) {
    return Scaffold( // estruturando a tela
      backgroundColor: Colors.white, // colocando fundo branco
      body: Column( // empilha os widgets verticalmente
        crossAxisAlignment: CrossAxisAlignment.start, // alinha os filhos à esquerda
        children: [
          const ParteSuperior(), // chama o widget da parte superior (X e foto)
          const VcSeg(), // chama o widget do "Para você" e "Seguindo"
          Expanded( // ocupa o espaço restante da tela para a lista de tweets
            child: ListView.separated(
              itemCount: tweets.length, // quantidade de tweets na lista
              separatorBuilder: (context, index) => const Divider( // linha entre cada card
                height: 0,
                thickness: 0.8, // tamanho da linha divisória
              ),
              itemBuilder: (context, index) { // chamado para cada item da lista
                return TweetCard(tweet: tweets[index]); // cria um card para cada tweet
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: const ParteInferior(), // chama o widget da parte inferior
      floatingActionButton: FloatingActionButton( // botão azul com "+"
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () {},
        child: const Icon(Icons.add), // ícone "+" dentro do botão
      ),
    );
  }
}
 
