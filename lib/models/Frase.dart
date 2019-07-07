import 'package:flutter/material.dart';

class Frase{
  String _texto;
  String _autor;
  AssetImage _imagem;

  Frase(this._texto, this._autor, this._imagem);

  get texto => this._texto;

  get autor => this.autor;

  get imagem => this._imagem;

}