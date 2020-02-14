import 'package:flutter/material.dart';

class BasicoPage extends StatelessWidget {

  final estiloTitulo = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  final estiloSubtitulo = TextStyle(fontSize: 18, color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Permite hacer un scroll
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            //Una imagen obtenida de internet
            crearImagen(),
            //Crea la tarjeta de titulo
            crearTitulo(),
            crearAcciones(),
            crearTexto(),
            crearTexto(),
            crearTexto(),
          ],
        ),
      )
    );
  }

  Widget crearImagen()
  {
    return Image(
      image: NetworkImage("https://images.pexels.com/photos/132037/pexels-photo-132037.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
    );
  }

  Widget crearTitulo()
  {
    //Respeta los espacios que proporciona la pantalla (Para en caso de colocar el dispositivo en horizontal)
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Row(
          children: <Widget>[
            //Aprovecha todo el espacio respetando el espacio del icono y el número
            Expanded(
              child: Column(
                //Alinea los widget hacia la izquierda
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Lago con un puente", style: estiloTitulo,),
                  SizedBox(height: 7,),
                  Text("Un lago en Alemania", style: estiloSubtitulo,)
                ],
              ),
            ),
            Icon(Icons.star, color: Colors.red, size: 30,),
            Text("41", style: TextStyle(fontSize: 20.0),)
          ],
        ),
      ),
    );
  }

  Widget crearAcciones()
  {
    return Row(
      //Espacio entre ellos distribuido de manera proporcional
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        accion(Icons.call, "CALL"),
        accion(Icons.near_me, "ROUTE"),
        accion(Icons.share, "SHARE")
      ],
    );
  }

  Widget accion(IconData icon, String text)
  {
    return Column(
      children: <Widget>[
        Icon(icon, color: Colors.blue, size: 40,),
        SizedBox(height: 5,),
        Text(text, style: TextStyle(fontSize: 15, color: Colors.blue),)
      ],
    );
  }

  Widget crearTexto()
  {
    //Respeta los espacios que proporciona la pantalla (Para en caso de colocar el dispositivo en horizontal)
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: Text(
          "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}