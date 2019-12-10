void main()
{
  //Una lista es un arreglo en otro lenguaje
  List numeros = [1, 2, 3, 4, 5];
  print(numeros);
  numeros.add("Hola mundo");
  print(numeros);
  
  //Lista restringida a enteros
  List<int> num = [1 ,2, 3, 4, 5];
  print(num);
  
  //Tamaño fijo
  List masNumeros = new List(10);
  print(masNumeros);
}