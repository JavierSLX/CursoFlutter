import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icono_string_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Componentes"),
      ),
      body: _lista(),
    );
  }

  //Crea la ListView
  Widget _lista() 
  {
    //Crea un widget relacionado a un futuro para poder resolverlo de manera interactiva
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: ((BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {

        print("builder");
        print(snapshot.data);

        //Regresa la lista con los elementos obtenidos del futuro
        return ListView(
          children: _listaItems(snapshot.data, context),
        );
      }),
    );
  }

  //Crea la lista de elementos
  List<Widget> _listaItems(List<dynamic> data, BuildContext context) 
  {
    final List<Widget> opciones = [];

    data.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue,),
        onTap: () {

          //Navega a otra pantalla individual
          // final route = MaterialPageRoute(
          //   builder: (context) => AlertPage()
          // );

          // Navigator.push(context, route);

          //Navega a distintas rutas definidas en main.dart
          Navigator.pushNamed(context, opt["ruta"]);
        },
      );

      //Agrega los widgets a la lista de opciones
      opciones..add(widgetTemp)..add(Divider());
    });

    return opciones;
  }
}