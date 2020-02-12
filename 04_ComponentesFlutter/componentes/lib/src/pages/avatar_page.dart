import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget 
{
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        //Agrega una lista de widgets al appbar
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage("https://ocbj.media.clients.ellingtoncms.com/img/photos/2018/07/26/Lee_Stan_t670.jpg?b3f6a5d7692ccc373d56e40cf708e3fa67d9af9d"),
              radius: 20.0,
            ),
          ),
          //Agrega un avatar circular
          Container(
            //Le da un margen para separar el avatar del borde
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text("SL"),
              backgroundColor: Colors.brown,
            ),
          )
        ],
      ),
      body: Center(
        //Una imagen obtenida en Internet
        child: FadeInImage(
          image: NetworkImage("https://m.eldiario.es/fotos/Stan-Lee-lanzando-presentacion-Spiderman_EDIIMA20181112_0851_19.jpg"),
          placeholder: AssetImage("assets/jar-loading.gif"),
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
    );
  }
}