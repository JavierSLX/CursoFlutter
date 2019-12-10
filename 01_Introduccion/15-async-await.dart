//Como en Javascript cada await debe de estar dentro de una funcion async
void main() async
{
  print("Estamos a punto de pedir datos");
  
  //Se resuelve el futuro usando async/await para ordenar la respuesta
  String data = await httpGet('API');
  print(data);
  
  print("Ultima linea");
}

//Un future es exactamente igual a una promesa
Future<String> httpGet(String url)
{
  //Duracion y un callback
  return Future.delayed(new Duration(seconds: 4), () => "Hola mundo");
}