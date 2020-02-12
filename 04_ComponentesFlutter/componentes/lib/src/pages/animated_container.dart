import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {

  //Variables de las propiedades que cambiarán
  double _witdh = 50.0;
  double _height = 50.0;
  Color _color = Colors.pink;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Container"),
      ),
      body: Center(
        //Define las propiedades del contenedor como sus medidas, su tipo de borde y su color
        child: AnimatedContainer(
          width: _witdh,
          height: _height,
          //Tiempo de la animación de la transicion
          duration: Duration(seconds: 1),
          //La animacion sale rapido y entra lento
          curve: Curves.fastOutSlowIn,
          decoration: BoxDecoration(
            borderRadius: _borderRadius,
            color: _color
          ),
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        //Cambia sus propiedades cuando se presiona el boton
        onPressed: (){
          //Genera numeros aleatorios
          final random = Random();

          //Redibuja el scaffold
          setState((){
            _witdh = random.nextInt(300).toDouble();
            _height = random.nextInt(300).toDouble();

            //Color random
            _color = Color.fromRGBO(random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);

            //Borde random
            _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
          });
        },
      ),
    );
  }
}