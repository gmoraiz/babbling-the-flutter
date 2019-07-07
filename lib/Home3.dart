import 'package:flutter/material.dart';
import 'models/Frase.dart';
import 'dart:math';
import 'package:carousel_slider/carousel_slider.dart';

//O maior bem que podemos fazer aos outros não é oferecer nossa riqueza, mas levá-los a descobrir a deles.
//Vai perseverantemente ao Sacrário, fisicamente ou com o coração, para te sentires seguro, para te sentires sereno: mas também para te sentires amado… e para amar!
//Onde está a verdadeira amizade, aí está o mesmo querer e o mesmo não querer, tanto mais agradável, quanto mais sincero
class Home3 extends StatefulWidget {
  @override
  _Home3State createState() => _Home3State();
}

class _Home3State extends State<Home3> with SingleTickerProviderStateMixin {
  List imgList = [
    'images/virgem-maria-1.jpg',
    'images/virgem-maria-2.jpg',
    'images/virgem-maria-3.jpg',
    'images/virgem-maria-4.jpg',
    'images/virgem-maria-5.jpg'
  ];

  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat();
  }

  Animatable<DecorationImage> background = TweenSequence<DecorationImage>([
    TweenSequenceItem(
      weight: 1.0,
      tween: Tween(
        begin: DecorationImage(image: ExactAssetImage('images/virgem-maria-1.jpg')),
        end: DecorationImage(image: ExactAssetImage('images/virgem-maria-2.jpg')),
      ),
    ),
    TweenSequenceItem(
      weight: 1.0,
      tween: Tween(
        begin: DecorationImage(image: ExactAssetImage('images/virgem-maria-2.jpg')),
        end: DecorationImage(image: ExactAssetImage('images/virgem-maria-3.jpg')),
      ),
    ),
    TweenSequenceItem(
      weight: 1.0,
      tween: Tween(
        begin: DecorationImage(image: ExactAssetImage('images/virgem-maria-3.jpg')),
        end: DecorationImage(image: ExactAssetImage('images/virgem-maria-4.jpg')),
      ),
    ),
  ]);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Scaffold(
            body: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  image: background.evaluate(AlwaysStoppedAnimation(_controller.value))
              ),
            ),
          );
        });
  }
}
