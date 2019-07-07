import 'package:flutter/material.dart';
import 'models/Frase.dart';
import 'dart:math';
import 'package:carousel_slider/carousel_slider.dart';

//O maior bem que podemos fazer aos outros não é oferecer nossa riqueza, mas levá-los a descobrir a deles.
//Vai perseverantemente ao Sacrário, fisicamente ou com o coração, para te sentires seguro, para te sentires sereno: mas também para te sentires amado… e para amar!
//Onde está a verdadeira amizade, aí está o mesmo querer e o mesmo não querer, tanto mais agradável, quanto mais sincero
class Home2 extends StatefulWidget {
  @override
  _Home2State createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  List imgList = [
    'images/virgem-maria-1.jpg',
    'images/virgem-maria-2.jpg',
    'images/virgem-maria-3.jpg',
    'images/virgem-maria-4.jpg',
    'images/virgem-maria-5.jpg'
  ];
  var _current = 0;

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Builder(
         builder: (context) => Center(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('images/virgem-maria-1.jpg'), fit:BoxFit.cover)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CarouselSlider(
                  //height: 600,
                  initialPage: 0,
                  viewportFraction: 1.0,
                  aspectRatio: 1,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  reverse: false,
                  enableInfiniteScroll: true,
                  autoPlayInterval: Duration(seconds: 5),
                  autoPlayAnimationDuration: Duration(milliseconds: 2000),
                  pauseAutoPlayOnTouch: Duration(seconds: 0),
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index) {
                    setState(() {
                      _current = index;
                    });
                  },
                  items: imgList.map((img) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 10.0),
                          decoration: BoxDecoration(
                            color: Colors.green,
                          ),
                          child: Image.asset(
                            img,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
//                Text("ICCLESIA",
//
//                    style: TextStyle(
//                    color: Colors.white,
//                    fontWeight: FontWeight.bold,
//                      fontSize: 30,
//                      shadows: [
//                        Shadow(color: Colors.black87, blurRadius: 30, offset: Offset(1, 1))
//                      ]
//                    ),
//
//                )
              ],
            )
          )
        )
      )
    );
  }
}
