import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class Home5 extends StatefulWidget {
  @override
  _Home5State createState() => _Home5State();
}

class _Home5State extends State<Home5>{
  var loadingEnter = false;
  List imgList = [
    'images/virgem-maria-1.jpg',
    'images/virgem-maria-2.jpg',
    'images/virgem-maria-3.jpg',
    'images/virgem-maria-4.jpg',
    'images/virgem-maria-5.jpg'
  ];

  Widget BGCarousel = ShaderMask(
    child: Carousel(
      images: [
        AssetImage('images/virgem-maria-1.jpg'),
        AssetImage('images/virgem-maria-2.jpg'),
        AssetImage('images/virgem-maria-3.jpg'),
        AssetImage('images/virgem-maria-4.jpg'),
        AssetImage('images/virgem-maria-5.jpg'),
      ],
      animationDuration: const Duration(seconds: 5),
      animationCurve: Curves.fastOutSlowIn,
      showIndicator: false,
      autoplayDuration: const Duration(seconds: 7),
      overlayShadow: true,
      overlayShadowColors: Colors.black,
      overlayShadowSize: 150,
    ),
    shaderCallback: (Rect bounds){
      return LinearGradient(

        colors: [Color.fromRGBO(134,116,68, 0.3), Color.fromRGBO(134,116,68, 0.6)],
        stops: [0.0, 0.5]
      ).createShader(bounds);
    },
    blendMode: BlendMode.srcATop,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          BGCarousel,
          Padding(
            padding: EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "ICCLESIA",
                  style: TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Cinzel",
                    fontSize: 45,
                    shadows: <Shadow>[
                      Shadow(color: Colors.white, blurRadius: 15.0)
                    ]
                  ),

                ),
                SizedBox(height: 32),
                TextField(
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),

                    textAlign: TextAlign.center,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    hintText: "Email/Usuário",
                    hintStyle: TextStyle(
                        color: Colors.white70
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.white, width: 1.5),
                      borderRadius: new BorderRadius.circular(50),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.white70, width:1.5),
                      borderRadius: new BorderRadius.circular(50),
                    )
                  )
                ),
                SizedBox(height: 16),
                TextField(
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                  obscureText: true,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    hintText: "Senha",
                    hintStyle: TextStyle(
                      color: Colors.white70
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.white, width: 1.5),
                      borderRadius: new BorderRadius.circular(50),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.white70, width:1.5),
                      borderRadius: new BorderRadius.circular(50),
                    )
                  )
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                        child: MaterialButton(
                          height: 60,
                          onPressed: (){
                            Navigator.push(context, SizeRoute(page: Register()));
                          },
                          color: Colors.white,
                          shape: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                bottomLeft: Radius.circular(50)
                            ),
                            borderSide: BorderSide(color: Colors.white, width:1.5),
                          ),
                          child: Text(
                              "Sou novo",
                              style: TextStyle(
                                color: Color.fromRGBO(134,116,68, 1),
                                fontSize: 20
                              ),
                          ),

                        ),
                    ),
                    Expanded(
                      child: MaterialButton(
                        height: 60,
                        onPressed: (){
                          setState((){
                            FocusScope.of(context).requestFocus(new FocusNode());
                            loadingEnter = !loadingEnter;
                          });
                        },
                        color: Colors.transparent,
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(50),
                              bottomRight: Radius.circular(50)
                          ),
                          borderSide: BorderSide(color: Colors.white, width:1.5),
                        ),
                        child: !loadingEnter ? Text(
                            "Entrar",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            )
                        ) : 
                        CircularProgressIndicator(
                          backgroundColor: Colors.white,
                          valueColor: AlwaysStoppedAnimation(Color.fromRGBO(134,116,68, 1))
                        ),

                      )
                    ),
                  ],
                ),
                SizedBox(height: 16),
                FlatButton(
                    onPressed: (){},
                    child: Text(
                        "Esqueci minha senha".toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        )
                    )
                )
              ],
            )
          )
        ]
      ),
    );
  }
}

class Register extends StatelessWidget {
  var _term = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: <Widget>[
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      ShaderMask(
                        child: SizedBox(
                            width: 500,
                            height: 200,
                            child: Image.asset(
                              "images/cristo-2.jpg",
                              fit: BoxFit.cover,
                              alignment: Alignment.topCenter,
                            )
                        ),
                        shaderCallback: (Rect bounds) {
                          return LinearGradient(

                              colors: [
                                Color.fromRGBO(134, 116, 68, 0.3),
                                Color.fromRGBO(134, 116, 68, 0.6)
                              ],
                              stops: [0.0, 0.5]
                          ).createShader(bounds);
                        },
                        blendMode: BlendMode.srcATop,
                      ),
                      Positioned.fill(
                          child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                  padding: EdgeInsets.only(
                                      bottom: 10, right: 16, left: 16),
                                  child: Text(
                                    "Nele nos movemos vivemos, somos e nos conectamos!",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontFamily: 'Cinzel',
                                        fontWeight: FontWeight.w500
                                    ),
                                  )
                              )
                          )
                      )
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.all(32),
                      child: Column(
                        children: <Widget>[
                          TextField(
                              style: TextStyle(
                                color: Color.fromRGBO(134, 116, 68, 1),
                                fontSize: 20,
                              ),

                              textAlign: TextAlign.start,
                              cursorColor: Color.fromRGBO(134, 116, 68, 1),
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                      Icons.person,
                                      color: Color.fromRGBO(134, 116, 68, 1)
                                  ),

                                  hintText: "Nome Completo",
                                  hintStyle: TextStyle(
                                      color: Colors.black26
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: new BorderSide(
                                        color: Color.fromRGBO(134, 116, 68, 1),
                                        width: 1.5),
                                    borderRadius: new BorderRadius.circular(50),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: new BorderSide(
                                        color: Color.fromRGBO(134, 116, 68, 1),
                                        width: 1.5),
                                    borderRadius: new BorderRadius.circular(50),
                                  )
                              )
                          ),
                          SizedBox(height: 16),
                          TextField(
                              style: TextStyle(
                                color: Color.fromRGBO(134, 116, 68, 1),
                                fontSize: 20,
                              ),

                              textAlign: TextAlign.start,
                              cursorColor: Color.fromRGBO(134, 116, 68, 1),
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                      Icons.person_outline,
                                      color: Color.fromRGBO(134, 116, 68, 1)
                                  ),

                                  hintText: "Usuário",
                                  hintStyle: TextStyle(
                                      color: Colors.black26
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: new BorderSide(
                                        color: Color.fromRGBO(134, 116, 68, 1),
                                        width: 1.5),
                                    borderRadius: new BorderRadius.circular(50),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: new BorderSide(
                                        color: Color.fromRGBO(134, 116, 68, 1),
                                        width: 1.5),
                                    borderRadius: new BorderRadius.circular(50),
                                  )
                              )
                          ),
                          SizedBox(height: 16),
                          TextField(
                              style: TextStyle(
                                color: Color.fromRGBO(134, 116, 68, 1),
                                fontSize: 20,
                              ),

                              textAlign: TextAlign.start,
                              cursorColor: Color.fromRGBO(134, 116, 68, 1),
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                      Icons.email,
                                      color: Color.fromRGBO(134, 116, 68, 1)
                                  ),

                                  hintText: "Email",
                                  hintStyle: TextStyle(
                                      color: Colors.black26
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: new BorderSide(
                                        color: Color.fromRGBO(134, 116, 68, 1),
                                        width: 1.5),
                                    borderRadius: new BorderRadius.circular(50),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: new BorderSide(
                                        color: Color.fromRGBO(134, 116, 68, 1),
                                        width: 1.5),
                                    borderRadius: new BorderRadius.circular(50),
                                  )
                              )
                          ),
                          SizedBox(height: 16),
                          TextField(
                              style: TextStyle(
                                color: Color.fromRGBO(134, 116, 68, 1),
                                fontSize: 20,
                              ),
                              obscureText: true,
                              textAlign: TextAlign.start,
                              cursorColor: Color.fromRGBO(134, 116, 68, 1),
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                      Icons.lock,
                                      color: Color.fromRGBO(134, 116, 68, 1)
                                  ),

                                  hintText: "Senha",
                                  hintStyle: TextStyle(
                                      color: Colors.black26
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: new BorderSide(
                                        color: Color.fromRGBO(134, 116, 68, 1),
                                        width: 1.5),
                                    borderRadius: new BorderRadius.circular(50),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: new BorderSide(
                                        color: Color.fromRGBO(134, 116, 68, 1),
                                        width: 1.5),
                                    borderRadius: new BorderRadius.circular(50),
                                  )
                              )
                          ),
                          SizedBox(height: 16),
                          CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            activeColor: Color.fromRGBO(134, 116, 68, 1),
                            onChanged: (value) {

                            },

                            title: Text(
                                "Concordo com os termos de uso",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 17)
                            ),
                            value: true,
                          ),
                          SizedBox(height: 8),
                          MaterialButton(
                              minWidth: double.infinity,
                              height: 60,
                              color: Colors.blue,
                              shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: BorderSide(width: 0)
                              ),
                              child: Text(
                                "Sou novo",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20
                                ),
                              )
                          )
                        ],
                      )
                  )
                ]
            ),
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: AppBar(
                  automaticallyImplyLeading: true,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                )
            )
          ]
      ),
    );
  }

}

class SlideRightRoute extends PageRouteBuilder {
  final Widget page;
  SlideRightRoute({this.page})
      : super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    page,
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(-1, 0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        ),
  );
}

class SizeRoute extends PageRouteBuilder {
  final Widget page;
  SizeRoute({this.page})
      : super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    page,
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        Align(
          child: SizeTransition(
            sizeFactor: animation,
            child: child,
          ),
        ),
  );
}
