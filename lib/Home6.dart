import 'package:flutter/material.dart';

class Home6 extends StatefulWidget {
  @override
  _Home6State createState() => _Home6State();
}

class _Home6State extends State<Home6>{
  var loadingEnter = false;

   static ListView list = ListView.builder(
    itemCount: 10,
    itemBuilder: (context, index) {
      return ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('images/virgem-maria-1.jpg'),
        ),
        title: Text('Gabriel Morais'),
        subtitle: Text('Hoje, 15:30')
      );
    }
    );

    static List<Widget> pages = [
      Container(
        color: Colors.white,
        child: list
      ),
      Container(
        color: Colors.white,
        child: list,
      ),
      Container(
        color: Colors.white,
        child: list,
      ),
  ];

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Icclesia", style: TextStyle(color: Colors.black54)),
      ),
      body: Column(
        children: <Widget> [
          Flexible(
            child: Padding(
              padding: EdgeInsets.only(top:10, bottom: 5, right: 16, left: 16),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 15,
                itemBuilder: (context, index){
                  return Container(
                    margin: EdgeInsets.only(right:10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            width: 60.0,
                            height: 60.0,
                            decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                image: new DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage('images/virgem-maria-1.jpg')
                                )
                            )
                        ),
                        Text('username', style: TextStyle(color: Colors.black87), textAlign: TextAlign.center,)
                      ]
                    )
                  );
                },
              ),
            )
          ),
          Container(
            height: 600,
            child: PageView(
                children: pages,
                controller: controller
            )
          )
        ]
      )
    );
  }

}