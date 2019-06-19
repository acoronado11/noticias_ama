import 'dart:async';
import 'dart:convert';
import 'package:noticias_ama/model/Noticia.dart';
import 'package:http/http.dart' as http;

class Requests {
  static Future<dynamic> peticionNoticias(recurso) async {
    var url = "https://newsapi.org/v2/top-headlines?language=es&apiKey=484d08cfbda74a04bccafc2799ea0943" ;
    if(recurso != null){
      url = "https://newsapi.org/v2/top-headlines?sources=$recurso&apiKey=484d08cfbda74a04bccafc2799ea0943";
    }
    var respuesta = await http.get(url);
    if (respuesta.statusCode == 200) {
      var jsonRespuesta = json.decode(respuesta.body);
//      print("Respuesta json");
//      print(jsonRespuesta);
      var listaNoticias = Noticia.fromJson(jsonRespuesta["articles"]);
      return listaNoticias;
    }
    return "Correcto";
  }

  static Future<List<dynamic>> peticionRecursos() async {
    var respuesta = await http.get(
        "https://newsapi.org/v2/sources?language=es&apiKey=484d08cfbda74a04bccafc2799ea0943");
    if (respuesta.statusCode == 200) {
      var jsonRespuesta = json.decode(respuesta.body);
//      print("Respuesta json");
//      print(jsonRespuesta);
      List<dynamic> listaRecursos = [];
      for (var i = 0; i < jsonRespuesta["sources"].length; i ++){
        listaRecursos.add(
            {
              "id" : jsonRespuesta["sources"][i]["id"],
              "name" : jsonRespuesta["sources"][i]["name"]
            }
        );
      }
      return listaRecursos;
      //var listaNoticias = Noticia.fromJson(jsonRespuesta["articles"]);
//      return listaNoticias;
    }
    List<dynamic> no = [];
    return no;
  }
}
