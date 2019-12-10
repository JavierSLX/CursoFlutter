void main()
{
  print("Estamos a punto de pedir datos");
  
  //Se resuelve el futuro
  httpGet('API').then((data) {
    print(data);
  });
  
  print("Ultima linea");
}

//Un future es exactamente igual a una promesa
Future<String> httpGet(String url)
{
  //Duracion y un callback
  return Future.delayed(new Duration(seconds: 4), () => "Hola mundo");
}