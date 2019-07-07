import 'package:flutter/material.dart';
import 'models/Frase.dart';
import 'dart:math';

//O maior bem que podemos fazer aos outros não é oferecer nossa riqueza, mas levá-los a descobrir a deles.
//Vai perseverantemente ao Sacrário, fisicamente ou com o coração, para te sentires seguro, para te sentires sereno: mas também para te sentires amado… e para amar!
//Onde está a verdadeira amizade, aí está o mesmo querer e o mesmo não querer, tanto mais agradável, quanto mais sincero
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Frase _frase;
  var _frases = [
    Frase("O maior bem que podemos fazer aos outros não é oferecer nossa riqueza, mas levá-los a descobrir a deles.", "Louis Lavelle", AssetImage("images/louislavelle.jpg")),
    Frase("Vai perseverantemente ao Sacrário, fisicamente ou com o coração, para te sentires seguro, para te sentires sereno: mas também para te sentires amado… e para amar!", "São José Maria Escrivá", AssetImage("images/saojosemariaescriva.jpg")),
    Frase("Onde está a verdadeira amizade, aí está o mesmo querer e o mesmo não querer, tanto mais agradável, quanto mais sincero", "São Tomás de Aquino", AssetImage("images/saotomasdeaquino.jpg"))
  ];

  @override
  void initState(){
    super.initState();
    escolherFrase();
  }

  Frase escolherFrase() {
    setState((){
      _frase = _frases[Random().nextInt(_frases.length)];
    });
  }

  Animatable<Image> background = TweenSequence<Image>([
    TweenSequenceItem(
      weight: 1.0,
      tween: Tween(
        begin: Image.asset('images/virgem-maria-1.jpg'),
        end: Image.asset('images/virgem-maria-2.jpg'),
      ),
    ),
    TweenSequenceItem(
      weight: 1.0,
      tween: Tween(
        begin: Image.asset('images/virgem-maria-2.jpg'),
        end: Image.asset('images/virgem-maria-3.jpg'),
      ),
    ),
    TweenSequenceItem(
      weight: 1.0,
      tween: Tween(
        begin: Image.asset('images/virgem-maria-3.jpg'),
        end: Image.asset('images/virgem-maria-4.jpg'),
      ),
    ),
  ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: Text("Frases diferentinhas"),

        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            padding: EdgeInsets.only(top:10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Icon(Icons.home, color: Colors.white, size:35),
                Icon(Icons.search, color: Colors.white, size: 35),
                Icon(Icons.notifications, color: Colors.white, size: 35)
              ],
            ),
          ),
          color: Colors.black87,
        ),
        body: Builder(
            builder: (context) => Center(
                child: Container(
                    padding: EdgeInsets.all(16),
                    child: Column(

                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Image(image: _frase.imagem),
                        Text(_frase.texto),
                        RaisedButton(
                          child: Text("TOASTTT!"),
                          onPressed: (){
                            escolherFrase();
                            Scaffold.of(context).showSnackBar(SnackBar(content: Text("Opaaa!")));
                          },

                        )
                      ],
                    )
                )
            )
        )
    );
  }
}
