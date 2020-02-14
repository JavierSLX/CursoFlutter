import 'package:flutter/material.dart';

class ScrollPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Manda a otra pagina
      body: PageView(
        //Para hacer el efecto que cambia de página
        scrollDirection: Axis.vertical,
        children: <Widget>[
          pagina1(),
          pagina2()
        ],
      )
    );
  }

  Widget pagina1()
  {
    //Acomoda los widget en forma de pila (los primeros seran los del fondo)
    return Stack(
      children: <Widget>[
        imagenFondo(),
        crearTextos(),
      ],
    );
  }

  Widget fondoPagina()
  {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(255, 138, 128, 1),
      child: Center(
        child: RaisedButton(
          shape: StadiumBorder(),
          color: Color.fromRGBO(255, 82, 82, 1),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Text("Bienvenidos", style: TextStyle(color: Colors.white, fontSize: 20),),
          ),
          onPressed: (){},
        ),
      ),
    );
  }

  Widget imagenFondo()
  {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image(
        image: AssetImage("assets/zelda.jpg"),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget crearTextos()
  {
    final estiloTexto  = TextStyle(color: Colors.white, fontSize: 50);

    return SafeArea(
      child: Column(
        children: <Widget>[
          SizedBox(height: 20,),
          Text('11º', style: estiloTexto,),
          Text('Miércoles', style: estiloTexto,),
          Expanded(child: Container(),),
          Icon(Icons.keyboard_arrow_down, size: 70, color: Colors.white,)
        ],
      ),
    );
  }

  Widget pagina2()
  {
    return Stack(
      children: <Widget>[
        fondoPagina()
      ],
    );
  }
}