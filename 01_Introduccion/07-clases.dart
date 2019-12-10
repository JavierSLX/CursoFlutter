void main()
{
  //Instancia de Heroe (Constante)
  final Heroe wolwerine = new Heroe(nombre: "Logan", poder: "Mutante");
  print(wolwerine);
  print(wolwerine.nombre);
}

//Clase Heroe
class Heroe
{
  String nombre;
  String poder;
  
  Heroe({String nombre = "Sin Nombre", String poder})
  {
    this.nombre = nombre;
    this.poder = poder;
  }
  
  String toString()
  {
    return "${this.nombre} - ${this.poder}";
  }
}
