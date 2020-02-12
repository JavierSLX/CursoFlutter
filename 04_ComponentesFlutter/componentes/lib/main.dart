import 'package:componentes/src/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes App',
      debugShowCheckedModeBanner: false,
      //Configura las localizacion(lenguajes) de la app
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [
        const Locale("en", "US"),
        const Locale("es", "ES")
      ],
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