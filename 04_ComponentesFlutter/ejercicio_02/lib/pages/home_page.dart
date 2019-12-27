import 'package:ejercicio_02/menu/menu_provider.dart';
import 'package:ejercicio_02/utils/icono_string.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget 
{
  
  @override
  Widget build(BuildContext context) 
  {
    //Regresa una pantalla standart de aplicacion
    return Scaffold(
      //Bara de texto con un titulo centrado
      appBar: AppBar(
        title: Text("Ejercicio 02: Principal"),
        centerTitle: true,
      ),
      //Cuerpo de la pantalla
      body: _lista(),
    );
  }

  //Crea la ListView
  Widget _lista()
  {
    //Crea un widget que interactua directamente con un futuro que se resuelve dinamicamente
    return FutureBuilder(
      //El futuro que se analiza
      future: menu.cargarData(),
      //Valor inicial antes de que se resuelve el futuro
      initialData: [],
      //Resolviendo el futuro
      builder: ((BuildContext context, AsyncSnapshot<List<dynamic>> snapshot){

        //Imprime en consola lo que se obtiene
        // print("Menu");
        // print(snapshot.data);

        //Regresa la ListView
        return ListView(
          children: _listaElementos(snapshot.data, context),
        );
      }),
    );
  }

  //Crea la lista de elementos de la lista
  List<Widget> _listaElementos(List<dynamic> data, BuildContext context)
  {
    final List<Widget> elementos = [];

    //Obtiene cada uno de los elementos
    for(dynamic opt in data)
    {
      //Widget de tipo tarjeta
      Widget widget = ListTile(
        //Titulo de la tarjeta
        title: Text(opt['texto']),
        //Icono de la tarjeta
        leading: getIcon(opt["icono"]),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
        onTap: (){
          //Dirige a la ruta que fue especificada en la pantalla principal
          Navigator.pushNamed(context, opt["ruta"]);
        },
      );

      //Agrega el widget en la lista
      elementos..add(widget)..add(Divider());
    }

    return elementos;
  }
}