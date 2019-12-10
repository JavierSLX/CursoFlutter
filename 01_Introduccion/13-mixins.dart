void main()
{
  final Delfin delfin = new Delfin();
  delfin.nadador();
}

abstract class Animal
{
  
}

abstract class Mamifero extends Animal
{
  
}

abstract class Ave extends Animal
{
  
}

abstract class Pez extends Animal
{
  
}

abstract class Volador
{
  void volar() => print("Estoy volando!");
}

abstract class Caminante
{
  void caminar() => print("Estoy caminando!");
}

abstract class Nadador
{
  void nadador() => print("Estoy nadando!");
}

//Mezcla de clases
class Delfin extends Mamifero with Nadador
{
  
}

class Murcielago extends Ave with Caminante, Volador
{
  
}

class Gato extends Mamifero with Caminante
{
  
}