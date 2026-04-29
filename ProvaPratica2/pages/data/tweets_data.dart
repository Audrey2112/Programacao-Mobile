import 'package:flutter/material.dart';
import '../modelos_twiter.dart';

final List<Modelostwiter> tweets = [
  // - Lista de tweets, simulando exemplos reais
  const Modelostwiter(
    nomeUsuario: 'Athletico Paranaense',
    arroba: '@cap',
    letraUsuario: 'CAP',
    iconeCor: Color.fromARGB(255, 131, 2, 2),
    tempo: '1h',
    textoUsuario: 'ALERTA DE BASTIDORES NO AR! \nSpoiler: tá bom demais \n\nCOnfira no nosso youtube: youtube.com/watch?v=ZP... ',
    imagemPost: 'https://th.bing.com/th/id/OIP.44oR6_G5NuMP1nF2D3AgawHaEn?w=260&h=180&c=7&r=0&o=7&pid=1.7&rm=3', // url/link da imagem
    ehVerificado: true,
    traduzido: true,
    comentarios: 900,
    retuweets: 800,
    likes: 990,
    views: '250k',
  ),

  const Modelostwiter(
    nomeUsuario: 'BeSoccer',
    arroba: '@besoccer',
    letraUsuario: 'B',
    iconeCor: Color.fromARGB(255, 16, 204, 9),
    tempo: '8h',
    textoUsuario: 'Bem, pelo menos ele devole na mesma moeda.',
    imagemPost: 'https://th.bing.com/th/id/OIP.ZCiKD4sotGzflnKd8XU1_gHaEK?w=313&h=180&c=7&r=0&o=7&pid=1.7&rm=3',
    ehVerificado: true,
    traduzido: true,
    comentarios: 250,
    retuweets: 300,
    likes: 600,
    views: '100k',
  ),

  const Modelostwiter(
    nomeUsuario: 'NaumFLY',
    arroba: '@naaumfly',
    letraUsuario: 'N',
    iconeCor: Color.fromARGB(255, 81, 81, 82),
    tempo: '16h',
    textoUsuario: '3 unidades nesse ultra BUG',
    imagemPost: 'https://pbs.twimg.com/media/HG3dx9fbIAAd_TD?format=png&name=medium',
    ehVerificado: false,
    comentarios: 2,
    retuweets: 0,
    likes: 23,
    views: '10.4k',
  ),

  const Modelostwiter(
    nomeUsuario: 'Rogue duck Interactive',
    arroba: '@rogueduck',
    letraUsuario: 'RD',
    iconeCor: Color.fromARGB(255, 144, 32, 218),
    tempo: '',
    textoUsuario: 'Run a second-hand game sotore! Buy sell, negotiate, make profite! (Wishlst on Steam)',
    imagemPost: 'https://tse2.mm.bing.net/th/id/OIP.pBcYQ_IOfIkpxp8SZ3rAmAAAAA?rs=1&pid=ImgDetMain&o=7&rm=3',
    ehVerificado: false,
    ehAnuncio: true,
    comentarios: 23,
    retuweets: 99,
    likes: 100,
    views: '23.9k',
  ),
];
