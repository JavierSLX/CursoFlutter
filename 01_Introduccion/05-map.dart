void main()
{
  //En otro lenguaje es parecido a un JSON
  Map<String, dynamic> persona = {
    "nombre": "Carlos",
    "edad": 32,
    "soltero": true
  };
  
  //Obtenemos una propiedad del mapa
  print(persona['nombre']);
  
  //Agregamos una nueva propiedad
  persona["estatura"] = 1.78;
  
  print(persona.keys);
  
  Map<int, String> personas = {
    1: 'Tony',
    2: 'Peter',
    9: 'Strange'
  };
  
  //Agregamos un elemento
  personas.addAll({10: 'Banner'});
  print(personas);
}