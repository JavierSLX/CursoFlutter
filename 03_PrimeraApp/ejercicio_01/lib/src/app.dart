
import 'package:flutter/material.dart';

//Clase que crea la pagina inicial
class Inicial extends StatelessWidget
{
  @override
  Widget build(context)
  {
    return MaterialApp(home: Page(), debugShowCheckedModeBanner: false,);
  }
}

//Pagina que crea el scaffold
class Page extends StatefulWidget
{
  createState()
  {
    return _PageState();
  }
}

class _PageState extends State<Page>
{
  String texto = "Este texto cambia";
  @override
  Widget build(context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ejercicio 01", style: TextStyle(fontStyle: FontStyle.italic),),
        centerTitle: true,
      ),
      body: Center(
        child: Text(texto)
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(child: Icon(Icons.accessibility_new), onPressed: () => setState(() => texto = "Estoy despierto"),),
          SizedBox(width: 5.0,),
          FloatingActionButton(child: Icon(Icons.airline_seat_flat), onPressed: () => setState(() => texto = "Estoy dormido"),),
          SizedBox(width: 5.0,),
          FloatingActionButton(child: Icon(Icons.directions_run), onPressed: () => setState(() => texto = "Estoy corriendo"),)
        ],
      ),
    );
  }
}