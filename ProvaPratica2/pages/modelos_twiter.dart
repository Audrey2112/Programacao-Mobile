import 'package:flutter/material.dart'; 

class Modelostwiter {
  final String nomeUsuario;
  final String arroba; // @ do usuário
  final String letraUsuario;
  final String tempo;
  final Color iconeCor;
  final String textoUsuario;
  final bool ehVerificado;
  final bool ehAnuncio;
  final bool traduzido;
  final int comentarios;
  final int likes;
  final int retuweets;
  final String? views; // indica que pode ser nulo, usando o ?
  final String? imagemPost;

  const Modelostwiter({ // - const significa que o objeto inteiro é criado em tempo de compilação, não em execução.
    required this.nomeUsuario,
    required this.arroba,
    required this.letraUsuario,
    required this.iconeCor,
    required this.tempo,
    required this.textoUsuario,
    this.ehVerificado = false, // valor padrão sendo falso
    this.ehAnuncio = false,
    this.traduzido = false,
    required this.comentarios,
    required this.likes,
    required this.retuweets,
    this.views,
    this.imagemPost,
  });
}
