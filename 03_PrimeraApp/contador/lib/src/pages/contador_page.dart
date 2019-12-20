import 'package:flutter/material.dart';

//Clase Stateful que permite realizar cambios dinamicos internos en el widget
class ContadorPage extends StatefulWidget
{
  //Regresa una instancia del PageState
  createState()
  {
    return _ContadorPageState();
  }
}

//Clase del estado del StatefulWidget
class _ContadorPageState extends State<ContadorPage>
{
  final TextStyle _estiloTexto = new TextStyle(fontSize: 24);
  int _conteo = 10;

  @override
  Widget build(BuildContext context) 
  {
    //Un scaffold es una pantalla con una barra y un boton flotante
    return Scaffold(
      appBar: AppBar( //Appbar con un titulo centrado
        title: Text("Stateful"),
        centerTitle: true,
      ),
      body: Center( //El cuerpo de la pantalla
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, //Columna centrica
          children: <Widget>[ //Arreglo de Widgets en forma de columna
            Text("Número de clicks:", style: _estiloTexto),
            Text("$_conteo", style: TextStyle(fontSize: 30.0),) //Muestra el valor de la variable
          ],
        )
      ),
      floatingActionButton: _crearBotones()
    );
  }

  Widget _crearBotones()
  {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end, //Alinea los widget hasta la derecha del row
      children: <Widget>[
        SizedBox(width: 30,),
        FloatingActionButton(child: Icon(Icons.exposure_zero), onPressed: () => setState(() => _conteo = 0)), //Coloca la variable a 0
        Expanded(child: SizedBox()),//Espacio de separacion expandido
        FloatingActionButton(child: Icon(Icons.remove), onPressed: () => setState(() => _conteo--)), //Decrementa la variable
        SizedBox(width: 5.0,), //Espacio de separacion 
        FloatingActionButton(child: Icon(Icons.add), onPressed: () => setState(() => _conteo++)) //Incrementa la variable
      ],
    );
  }
}