import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cards"),
      ),
      body: ListView(
        //Margen interno
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(height: 30.0,),
          _cardTipo2(),
          SizedBox(height: 30.0,),
          _cardTipo1(),
          SizedBox(height: 30.0,),
          _cardTipo2(),
          SizedBox(height: 30.0,),
          _cardTipo1(),
          SizedBox(height: 30.0,),
          _cardTipo2(),
          SizedBox(height: 30.0,),
        ],
      ),
    );
  }

  //Crea una tarjeta sencilla (Parecida a la usada en Material Design de Android)
  Widget _cardTipo1() 
  {
    //Regresa una tarjeta
    return Card(
      //Elevacion de la tarjeta
      elevation: 5.0,
      //Bordes de las esquinas
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue,),
            title: Text("Soy el titulo de esta tarjeta"),
            subtitle: Text("Aqui estamos con la descripcion con la tarjeta que quiero que ustedes ven para mostrar"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              //Botón parecido a un link
              FlatButton(
                child: Text("Cancelar", style: TextStyle(color: Colors.blue),),
                //Al presionar el botón
                onPressed: (){

                },
              ),
              //Al presionar el botón
              FlatButton(
                child: Text("Aceptar", style: TextStyle(color: Colors.blue)),
                onPressed: (){
                  
                },
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _cardTipo2() 
  {
    final card = Container(
      child: Column(
        children: <Widget>[
          //Widget que permite mostrar una imagen en lo que se carga otra
          FadeInImage(
            image: NetworkImage("https://miro.medium.com/max/4320/0*QNdQhs_T3ffa6B0m.jpeg"),
            placeholder: AssetImage("assets/jar-loading.gif"),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300.0,
            fit: BoxFit.cover,
          ),
          //Carga una imagen por una url
          /*Image(
            image: NetworkImage("https://miro.medium.com/max/4320/0*QNdQhs_T3ffa6B0m.jpeg"),
          ),*/
          Container(
            //Da un margen al contenedor
            padding: EdgeInsets.all(10.0),
            child: Text("No tengo idea de que poner")
          )
        ],
      ),
    );

    //Coloca la tarjeta en un contenedor
    return Container(
      //Borde del contenedor
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        //Simula la sombra de la elevacion
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            //Se mueve la sombra en los puntos cardinales
            offset: Offset(2.0, 10.0)
          )
        ]
      ),
      //Corta el contenido del widget
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: card,
      ),
    );
  }
}