import 'package:componentes/src/routes/routes.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      //Define las rutas a donde se puede navegar en la app
      routes: getApplicationRoutes(),
      //Rutas dinamicas que no están definidas
      onGenerateRoute: (settings){

        print(settings.name);

        //Reedirige la ruta de 'card'
        // return MaterialPageRoute(
        //   builder: (BuildContext context) => AlertPage()
        // );
      },
    );
  }
}