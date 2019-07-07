import 'package:flutter/material.dart';
import 'package:carousel/carousel.dart';

class Home4 extends StatefulWidget {
  @override
  _Home4State createState() => _Home4State();
}

class _Home4State extends State<Home4>{
  List imgList = [
    'images/virgem-maria-1.jpg',
    'images/virgem-maria-2.jpg',
    'images/virgem-maria-3.jpg',
    'images/virgem-maria-4.jpg',
    'images/virgem-maria-5.jpg'
  ];

  Widget BGCarousel = Container(
    child: Carousel(
      children: [
        AssetImage('images/virgem-maria-1.jpg'),
        AssetImage('images/virgem-maria-2.jpg'),
        AssetImage('images/virgem-maria-3.jpg'),
        AssetImage('images/virgem-maria-4.jpg'),
        AssetImage('images/virgem-maria-5.jpg'),
      ].map((bgImg) => Image(
          image: bgImg,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover
      )).toList(),
      displayDuration: const Duration(seconds: 6),
      animationDuration: const Duration(seconds: 10),
      animationCurve: Curves.slowMiddle,
    )
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView(
            children: <Widget>[
              BGCarousel
            ],
          )
        ],
      ),
    );
  }
}
