import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  int _numero = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ejercicio 2: Contador"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //Muestra el texto
          Center(
            child: Text("Número de veces",
              style: TextStyle(
                fontSize: 25.0
              ),
            ),
          ),
          //Muestra la variable cambiante
          Center(
            child: Text("$_numero",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.red
              ),
            ),
          )
        ],
      ),
      //Agrega un renglon de widgets
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        //Coloca 2 botones y un espacio de separación
        children: <Widget>[
          FloatingActionButton(child: Text("--"), onPressed: () => setState(() => _numero--), heroTag: "btn1",),
          SizedBox(width: 5.0,),
          FloatingActionButton(child: Icon(Icons.add), onPressed: () => setState(() => _numero++), heroTag: "btn2",)
        ],
      ),
    );
  }
}