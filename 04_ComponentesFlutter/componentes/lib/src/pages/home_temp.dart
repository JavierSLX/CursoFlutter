import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {

  final opciones = ["Uno", "Dos", "Tres", "Cuatro", "Cinco"];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Componentes Temp"),
      ),
      body: ListView(
        children: _crearItemsCorta()
      ),
    );
  }

  //Crea la lista de los elementos
  List<Widget> _crearItems()
  {
    List<Widget> lista = new List<Widget>();

    for(String opt in opciones)
    {
      final tempWidget = ListTile(
        title: Text(opt),
        subtitle: Text("Cualquier cosa"),
      );

      //Agrega el elemento y un divisor
      /*lista.add(tempWidget);
      lista.add(Divider(color: Colors.black,));*/

      lista..add(tempWidget)..add(Divider(color: Colors.blue,));
    }

    return lista;
  }

  //Crea la lista mapeando los elementos
  List<Widget> _crearItemsCorta()
  {
    return opciones.map((String elemento) {

      return Column(
        children: <Widget>[
          ListTile(
            title: Text(elemento + "!"),
            subtitle: Text("Cualquier cosa"),
            leading: Icon(Icons.access_time),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: (){} ,
          ),
          Divider(color: Colors.black,)
        ],
      );
    }).toList();
  }
}