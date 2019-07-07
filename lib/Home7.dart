import 'package:flutter/material.dart';
import 'dart:async';

class Home7 extends StatefulWidget {
  @override
  _Home7State createState() => _Home7State();
}

//animation na lista:
//estado inicial: após o GET nos stories, armazenarei todos.
//Todos serão printados na tela com a animação.
//Numa segunda vez, após os dados já serem atualizados.
//Buscarei ordenar os stories já contidos no layout de acordo com o da requisição atual, que já virá ordenada
//Na iteração verificarei: ITEM já existe na lista ? Remove e insere novamente na devida posição coom o animation
//Caso nao exista, somente insere. O indice da inserção será sempre o indice atual do array iterado.
//Caso o item não passe nem por remove e insert, permanecerá intacto na posição que lhe couber até o final da iteração.

class _Home7State extends State<Home7>{

  List<String> chips  = ["Top Poesias", "Top Citações", "Grupos", "Eventos", "Mais comentados", "Top Semana"];
  List<String> tags   = ["#hashtag1", "#hashtag2maior", "#hashtag3maiorainda", "#amenor", "#amediaviu?", "Ver mais..."];
  List<Map<String, String>> categories = [
    {'image': 'cristo-1.jpg',         'name': 'Teologia' },
    {'image': 'cristo-2.jpg',         'name': 'Filosofia' },
    {'image': 'virgem-maria-1.jpg',   'name': 'Ciências Exatas' },
    {'image': 'virgem-maria-2.jpg',   'name': 'Literatura' },
    {'image': 'virgem-maria-3.jpg',   'name': 'Música' },
    {'image': 'virgem-maria-4.jpg',   'name': 'Mariologia' },
    {'image': 'virgem-maria-5.jpg',   'name': 'Empreemndedorismo' },
    {'image': 'saotomasdeaquino.jpg', 'name': 'Santos' }
  ];
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  void changeItemPosition(){
    setState(() {
      int removeIndex = 2;
      String aux = chips.removeAt(removeIndex);
      listKey.currentState.removeItem(removeIndex, (context, animation) => buildItem(context, removeIndex, animation));

      int insertIndex = 1;
      chips.insert(insertIndex, aux);
      listKey.currentState.insertItem(insertIndex);
    });
  }
  
  Widget buildItem(BuildContext context, int index, Animation animation) {
    return SizeTransition(
      key: ValueKey<int>(index),
        axis: Axis.horizontal,
        sizeFactor: animation ,
        child: Container(
      margin: EdgeInsets.only(right:7),
      child: Chip(
        shape: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromRGBO(134,116,68, 1), width: 2),
          borderRadius: BorderRadius.circular(50)
        ),
        backgroundColor: Colors.transparent ,
        label: Text(chips[index].toUpperCase(), style: TextStyle(color: Color.fromRGBO(134,116,68, 1), fontWeight: FontWeight.bold),),
      )
    )
    );
  }

  Widget myChips(){
    return Container(
          margin: EdgeInsets.only(top:16),
          height: 35,
            child: Directionality(
                textDirection: TextDirection.ltr,
                child: AnimatedList(
                    padding: EdgeInsets.symmetric(horizontal:16),
                    scrollDirection: Axis.horizontal,
                    key: listKey,
                    physics: ClampingScrollPhysics(),
                    initialItemCount: chips.length,
                    itemBuilder: (context, index, animation) {
                      return Container(
                          margin: EdgeInsets.only(right:7),
                          child: Chip(

                            shape: OutlineInputBorder(
                                borderSide: BorderSide(color: Color.fromRGBO(134,116,68, 1), width: 2),
                                borderRadius: BorderRadius.circular(50)
                            ),
                            backgroundColor: Colors.transparent ,
                            label: Text(chips[index].toUpperCase(), style: TextStyle(color: Color.fromRGBO(134,116,68, 1), fontWeight: FontWeight.bold),),
                          )
                      );
                    }
                )
            )
    );
  }

  Widget myTags(){
    return Padding(
        padding: EdgeInsets.only(top: 10, right: 10, left: 10, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: tags.map((x){
            return Padding(
              padding: EdgeInsets.only(top:10, right:10, left:10, bottom:0),
              child: Text(
                x,
                style: TextStyle(
                  color: Color.fromRGBO(134,116,68, 1),
                  fontSize: 20,
                  fontWeight: x == "Ver mais..." ? FontWeight.bold : FontWeight.normal
                ),
              )
            );
          }).toList()
      )
    );
  }

  Widget myCategoriesGradient(){
    return GridView.count(
      // Create a grid with 2 columns. If you change the scrollDirection to
      // horizontal, this produces 2 rows.
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: ScrollPhysics(),
      // Generate 100 widgets that display their index in the List.
      children: List.generate(categories.length, (i) {
        return Stack(
          children: <Widget>[
            ShaderMask(
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/${categories[i]['image']}"),
                        fit: BoxFit.cover
                    )
                ),
              ),
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                    colors: [
//                      Color.fromRGBO(134, 116, 68, 0.8),
//                      Color.fromRGBO(134, 116, 68, 0.8)
                      Colors.transparent,
                      Colors.transparent
                    ],
                    stops: [0.0, 0.5]
                ).createShader(bounds);
              },
              blendMode: BlendMode.srcATop,
            ),
            Center(
              child: Text(
                  categories[i]['name'],
                style:TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontFamily: 'Cinzel',
                  shadows: <Shadow>[
                    Shadow(
                      color: Colors.black,
                      blurRadius: 8,
                      offset: Offset(1, 1)
                    )
                  ]
                )
              )
            )
          ],
        );
      }),
    );
  }


  Widget myCategories(){
    return GridView.count(
      // Create a grid with 2 columns. If you change the scrollDirection to
      // horizontal, this produces 2 rows.
      crossAxisCount: 2,
      shrinkWrap: true,

      physics: ScrollPhysics(),
      // Generate 100 widgets that display their index in the List.
      children: List.generate(categories.length, (i) {
        return Stack(
          children: <Widget>[
            Center(
              child: Container(
                width: 190,
                height: 190,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage("images/${categories[i]['image']}"),
                        fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop)
                    )
                ),
              ),
            ),
            Center(
              child: Text(
                categories[i]['name'],
                style:TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontFamily: 'Cinzel',
                  shadows: <Shadow>[
                    Shadow(
                      color: Colors.black,
                      blurRadius: 8,
                      offset: Offset(1, 1)
                    )
                  ]
                )
              )
            )
          ],
        );
      }),
    );
  }

  Widget myCategories2(){
    return GridView.count(
      // Create a grid with 2 columns. If you change the scrollDirection to
      // horizontal, this produces 2 rows.
      crossAxisCount: 2,
      shrinkWrap: true,
padding: EdgeInsets.all(2),
      physics: ScrollPhysics(),
      // Generate 100 widgets that display their index in the List.
      children: List.generate(categories.length, (i) {
        return Stack(
          children: <Widget>[
            Center(
              child: Container(
                margin: EdgeInsets.all(2),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/${categories[i]['image']}"),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop)
                    )
                ),
              ),
            ),
            Center(
                child: Text(
                    categories[i]['name'],
                    style:TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontFamily: 'Cinzel',
                        shadows: <Shadow>[
                          Shadow(
                              color: Colors.black,
                              blurRadius: 8,
                              offset: Offset(1, 1)
                          )
                        ]
                    )
                )
            )
          ],
        );
      }),
    );
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), (){
      changeItemPosition();
      print("Timer executed");
    });
  }
  @override
  Widget build(BuildContext context) {
    final Map<int, Animation<double>> animations = <int, Animation<double>>{};

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, color: Color.fromRGBO(134,116,68, 1), size: 30),
          )
        ],
        title: Text(
          "Explorador",
          style: TextStyle(
            color: Color.fromRGBO(134,116,68, 1)
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children:  <Widget>[
          Flexible(
            child: ListView(
              children: <Widget>[
                myChips(),
                myTags(),
                myCategories2(),
              ],
            ),
          )
        ]
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 10,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(icon: Icon(Icons.home), disabledColor: Color.fromRGBO(134,116,68, 1), iconSize: 30,),
            IconButton(icon: Icon(Icons.search), disabledColor: Color.fromRGBO(134,116,68, 1), iconSize: 30,),
            IconButton(icon: Icon(Icons.add), disabledColor: Color.fromRGBO(134,116,68, 1), iconSize: 30,),
            IconButton(icon: Icon(Icons.notifications), disabledColor: Color.fromRGBO(134,116,68, 1), iconSize: 30,),
            IconButton(icon: Icon(Icons.person), disabledColor: Color.fromRGBO(134,116,68, 1), iconSize: 30,),
          ],
        )
      )
    );
  }

}