import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _nombre;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs de texto'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearPersona()
        ],
      ),
    );
  }

  Widget _crearInput() {
    //Regresa una caja de texto individual
    return TextField(
      //Se pone el foco al iniciar
      autofocus: true,
      //Capitalizacion de las palabras
      textCapitalization: TextCapitalization.words,
      //Coloca un borde, una leyenda, una sugerencia, una etiqueta, texto de ayuda, un icono al inicio y al final
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counter: Text("Letras ${_nombre.length}"),
        hintText: "Coloque su nombre",
        labelText: "Nombre",
        helperText: "Sólo es el nombre",
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle)
      ),
      //Cuando cambia el texto que contiene
      onChanged: (texto){

        //Redibuja cada vez que se cambia
        setState((){ 
          _nombre = texto;
        });

        //Muestra el nombre en consola
        print(_nombre);
      },
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text("Nombre es: $_nombre"),
    );
  }
}