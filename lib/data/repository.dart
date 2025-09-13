//en esta clase modelaremos los datos de nuestra API
import 'dart:convert';

import 'package:app_superheroes/data/model/superhero_response.dart';
import 'package:http/http.dart' as http;

class Repository {
  Future<SuperheroResponse?> fetchSuperHeroInfo(String name) async{
    final response = await http.get(Uri.parse(
      "https://superheroapi.com/api/a55d344895ed6ed4cf2b37b61be03368/search/$name"
    ));

    if(response.statusCode == 200){
      var decodedJson = jsonDecode(response.body);
      SuperheroResponse respuesta = SuperheroResponse.fromJson(decodedJson);
      return respuesta;
    }else{
      return null;
    }
  }
}