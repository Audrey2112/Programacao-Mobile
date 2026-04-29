import 'package:flutter/material.dart'; // importa widgets visuais
import 'modelos_twiter.dart'; // importa o modelo de dados
 
class TweetCard extends StatelessWidget {
  final Modelostwiter tweet;
  const TweetCard({super.key, required this.tweet});
 
  @override
  Widget build(BuildContext context) {
    return InkWell( // torna clicável, tem efeito ao clicar no card
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row( // organiza: avatar pra esquerda, conteúdo pra direita
          crossAxisAlignment: CrossAxisAlignment.start, // alinha tudo pelo topo
          children: [
            TweetAvatar(tweet: tweet),
            const SizedBox(width: 10), // espaço entre avatar e conteúdo
            Expanded( // ocupa o espaço restante depois do avatar
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TweetHeader(tweet: tweet),
                  const SizedBox(height: 4),
                  Text(tweet.textoUsuario, style: const TextStyle(fontSize: 15)), // texto do tweet
                  if (tweet.imagemPost != null) ...[
                    const SizedBox(height: 15), // espaço entre texto e imagem
                    ClipRRect( // recorta a imagem com bordas arredondadas
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        tweet.imagemPost!, // carrega imagem pela URL
                        width: double.infinity, // ocupa toda a largura disponível
                        height: 200, // altura fixa
                        fit: BoxFit.cover, // ajusta a imagem sem distorcer
                      ),
                    ),
                  ],
                  const SizedBox(height: 10),
                  TweetActionBar(tweet: tweet),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
 
class TweetAvatar extends StatelessWidget { // círculo com letras do usuário
  final Modelostwiter tweet;
  const TweetAvatar({super.key, required this.tweet});
 
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 22, // tamanho do circulo
      backgroundColor: tweet.iconeCor,
      child: Text(
        tweet.letraUsuario,
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}
 
class TweetHeader extends StatelessWidget {
  final Modelostwiter tweet;
  const TweetHeader({super.key, required this.tweet});
 
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Wrap( // quebra linha automaticamente se não couber o texto
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 4, // espaço entre os textos
            children: [
              Text(
                tweet.nomeUsuario,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                overflow: TextOverflow.ellipsis, // coloca ... se o nome for longo
              ),
              if (tweet.ehVerificado) // ícone verificado só aparece se for true
                const Icon(Icons.verified, color: Colors.blue, size: 16),
              if (tweet.ehAnuncio) // badge "Anúncio" só aparece se for true
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text('Anúncio', style: TextStyle(fontSize: 11, color: Colors.grey)),
                ),
              Text(
                tweet.tempo.isNotEmpty
                    ? '${tweet.arroba} - ${tweet.tempo}' // ex: "@cap - 1h"
                    : tweet.arroba, // só "@cap" se não tiver tempo
                style: const TextStyle(color: Colors.grey, fontSize: 13),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        const Icon(Icons.more_horiz, color: Colors.grey, size: 18), // ícone de ...
      ],
    );
  }
}
 
class TweetActionBar extends StatelessWidget {
  final Modelostwiter tweet;
  const TweetActionBar({super.key, required this.tweet});
 
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween, // espaço igual entre os botões
      children: [
        TweetActionButton(icon: Icons.chat_bubble_outline, count: tweet.comentarios), // comentários
        TweetActionButton(icon: Icons.repeat, count: tweet.retuweets), // retweets
        TweetActionButton(icon: Icons.favorite_border, count: tweet.likes), // curtidas
        TweetActionButton(icon: Icons.bar_chart, count: null, label: tweet.views), // visualizações
        TweetActionButton(icon: Icons.bookmark_border, count: null), // salvar
        TweetActionButton(icon: Icons.upload_outlined, count: null), // compartilhar
      ],
    );
  }
}
 
class TweetActionButton extends StatelessWidget {
  final IconData icon;
  final int? count;
  final String? label;
 
  const TweetActionButton({
    super.key,
    required this.icon,
    required this.count,
    this.label,
  });
 
  String get _display {
    if (label != null) return label!;
    if (count == null || count == 0) return '';
    if (count! >= 1000) return '${(count! / 1000).toStringAsFixed(1)}k'; // ex: 2000 -> "2.0k"
    return count.toString();
  }
 
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.grey),
        if (_display.isNotEmpty) ...[
          const SizedBox(width: 4),
          Text(_display, style: const TextStyle(color: Colors.grey, fontSize: 13)),
        ],
      ],
    );
  }
}
 
