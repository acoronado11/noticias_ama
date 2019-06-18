class Noticia {
  Noticia({
    this.titulo = " ",
    this.descripcion = " ",
    this.urlNoticia = " ",
    this.imagenUrl = " "
});
  final String titulo;
  final String descripcion;
  final String urlNoticia;
  final String imagenUrl;

  static List<Noticia> fromJson(List<dynamic> json){
    List<Noticia> lista = [];

    for (var i = 0; i < json.length; i ++){
      lista.add(
        new Noticia(
          titulo: json[i]["title"],
          descripcion: json[i]["description"],
          urlNoticia: json[i]["url"],
          imagenUrl: json[i]["urlToImage"],
        )
      );
    }

    return lista;
}

}