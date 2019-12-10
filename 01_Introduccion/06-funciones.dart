void main()
{
  print(saludar("Javier"));
  
  print(saludo(texto: "Hola,", nombre: "Javier"));
  print(saludo2(texto: "Hola,", nombre: "Javier"));
}

//Funcion que saluda
String saludar(String nombre)
{
  return "Hola $nombre";
}

String saludo({String texto, String nombre})
{
  return "$texto $nombre";
}

//Funcion flecha
String saludo2 ({String texto, String nombre}) => "$texto $nombre";