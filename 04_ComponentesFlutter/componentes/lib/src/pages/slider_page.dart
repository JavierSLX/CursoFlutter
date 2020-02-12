import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _valorSlider = 100;
  bool _bloquearCheck = false;

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
            //Crea un checkbox
            _crearCheckBox(),
            //Crea un switch
            _crearSwitch(),
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
      //Agrega separaciones parecido a una regla
      //divisions: 20,
      //Es un metodo que recibe el valor que contiene el slider (Bloquea el slider dependiendo del valor del checkbox)
      onChanged: !_bloquearCheck ? (valor){

        //Redibuja la app para dar efecto que se mueve el slider
        setState(() {
          _valorSlider = valor;
          print(valor);
        });
      } : null,
      //Coloca el valor por default
      value: _valorSlider,
      //Valores minimos y maximos
      min: 10,
      max: 400,
    );
  }

  //Regresa una imagen
  Widget _crearImagen() {
    return Image(
      image: NetworkImage("https://www.elcomercio.com/files/article_main/uploads/2019/03/29/5c9e3ddfc85ca.jpeg"),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }

  //Regresa un checkbox
  Widget _crearCheckBox() {
    //Checkbox sencillo
    /*return Checkbox(
      //Valor inicial
      value: _bloquearCheck,
      onChanged: (valor){
        //Redibuja el control para que se vea que cambie
        setState((){
          _bloquearCheck = valor;
        });
      },
    );*/

    //Checkbox con texto
    return CheckboxListTile(
      title: Text("Bloquear Slider"),
      value: _bloquearCheck,
      onChanged: (valor){
        //Redibuja el control para que se vea que cambie
        setState((){
          _bloquearCheck = valor;
        });
      }
    );
  }

  //Regresa un switch
  Widget _crearSwitch() {
    return SwitchListTile(
      title: Text("Bloquear Slider"),
      value: _bloquearCheck,
      onChanged: (valor){
        //Redibuja el control para que se vea que cambie
        setState((){
          _bloquearCheck = valor;
        });
      }
    );
  }
}