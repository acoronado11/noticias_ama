import 'dart:async';
import 'dart:convert';
import 'package:noticias_ama/model/Noticia.dart';
import 'package:http/http.dart' as http;

class Requests{
  static Future<dynamic> peticionNoticias() async{
    var respuesta = await http.get("https://newsapi.org/v2/top-headlines?language=es&apiKey=484d08cfbda74a04bccafc2799ea0943");
    if(respuesta.statusCode == 200){
      var jsonRespuesta = json.decode(respuesta.body);
      print("Respuesta json");
      print(jsonRespuesta);
      var listaNoticias = Noticia.fromJson(jsonRespuesta["articles"]);
      return listaNoticias;
    }
    return "Correcto";
  }
}