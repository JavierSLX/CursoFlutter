import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _valorSlider = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Slider"),
      ),
      //Crea un contenedor con una columna y este manda llamar un widget
      body: Container(
        //Le da una separacion de 50 en la parte de arriba
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            //Agrega un slider
            _crearSlider(),
            //Agrega una imagen
            Expanded(child: _crearImagen())
          ],
        )
      ),
    );
  }

  //Widget que crea una barra desplazable
  Widget _crearSlider() {
    return Slider(
      //Le da color al slider
      activeColor: Colors.indigoAccent,
      label: "Tamaño de la imagen",
      //Agrega separaciones
      //divisions: 20,
      //Es un metodo que recibe el valor que contiene el slider
      onChanged: (valor){

        //Redibuja la app para dar efecto que se mueve el slider
        setState(() {
          _valorSlider = valor;
          print(valor);
        });
      },
      //Coloca el valor por default
      value: _valorSlider,
      //Valores minimos y maximos
      min: 10,
      max: 400,
    );
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage("https://www.elcomercio.com/files/article_main/uploads/2019/03/29/5c9e3ddfc85ca.jpeg"),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }
}