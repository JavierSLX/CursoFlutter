import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget 
{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Mostrar alerta"),
          color: Colors.blue,
          textColor: Colors.white,
          //Bordes redondeados
          shape: StadiumBorder(),
          //Al presionar la alerta
          onPressed: () => _mostrarAlerta(context),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_location),
        onPressed: (){

          //Regresa a la pagina anterior
          Navigator.pop(context);
        }
      )
    );
  }

  void _mostrarAlerta(BuildContext context)
  {
    //Muestra un dialogo
    showDialog(
      context: context,
      //No se cierra al darle click fuera del dialogo
      barrierDismissible: false,
      builder: (context){
        //Regresa el widget del dialogo a mostrar
        return AlertDialog(
          //Coloca bordes redondeados al dialogo
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Text("Titulo"),
          content: Column(
            //Ajusta el  tamaño de la columna ajustando solo el tamaño de su contenido
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("Este es el contenido de la caja de la alerta"),
              FlutterLogo(size: 100,)
            ],
          ),
          //Botones
          actions: <Widget>[
            FlatButton(
              child: Text("Cancelar"),
              //Navega de regreso al Scaffold
              onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text("Aceptar"),
              onPressed: (){
                //Navega de regreso al Scaffold
                Navigator.of(context).pop();
              },
            )
          ],
        );
      }
    );
  }
}