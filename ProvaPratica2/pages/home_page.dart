import 'package:flutter/material.dart'; 
import 'data/tweets_data.dart';
import 'tweets_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) { // - Base visual da página
    return Scaffold( // estrutura base de uma tela
      appBar: AppBar(  // Barra superior com título, ações, voltar
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        leading: Padding( // widget do canto esquerdo da AppBar
          padding: const EdgeInsets.all(8.0), // aqui indica o espaço interno
          child: CircleAvatar(
            backgroundColor: Colors.red.shade200,
            child: const Text('A', style: TextStyle(color: Colors.white)), // aqui é a letra e ícone do avatar que fica em cima
          ),
        ),
        title: const Text("X", // esse é o centro, o título do App
          style: TextStyle(color: Colors.white,
            fontSize: 20,
          ),
        ),
          centerTitle: true, // aqui que faz com que o título fique centralizado
      ),
      body: ListView.separated( itemCount: tweets.length,  // - Conteúdo principal, definidi ali como listável (lista)
        separatorBuilder: (context, index) => const Divider( // linha entre cada card, para dividir e ficar + bonito
          height: 0,
          thickness: 0.5, // tamanho da linha que divide os cards
        ),
        itemBuilder: (context, index) { // chamado para cada item
          return TweetCard(tweet: tweets[index]); // cria um card para cada tweet
        },
      ),
      floatingActionButton: FloatingActionButton( // aqui é botão que tem o "+", em azul
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () {}, 
        child: const Icon(Icons.add), // aqui coloca o "+" dentro do botão
     ),
    );
  }
}
