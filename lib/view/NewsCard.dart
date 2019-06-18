import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';
import 'package:noticias_ama/model/Noticia.dart';

class NewsCard extends StatefulWidget {
  NewsCard(this.noticia);
  final Noticia noticia;
  @override
  State createState() {
    return new _NewsCard();
  }
}

class _NewsCard extends State<NewsCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Stack(
              alignment: Alignment(0.0, 1.0),
              children: <Widget>[
                Image.network(
                    widget.noticia.imagenUrl),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: new BoxDecoration(
                    color: Color.fromRGBO(0, 0, 0, 0.7),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Column(
                      children: <Widget>[
                        new Text(
                          widget.noticia.titulo,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: Theme.of(context).textTheme.title.fontSize),
                        ),
                        new Text(
                          widget.noticia.descripcion.length >= 100 ? widget.noticia.descripcion.substring(0,100)+" . . ." : widget.noticia.descripcion ,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Divider(color: Colors.black,),
            Row(
              children: <Widget>[
                FlatButton(
                  onPressed: (){
                    print("url de noticia: ${widget.noticia.urlNoticia}");
                    _openUrl(widget.noticia.urlNoticia);
                  },
                  child: Text("Ver Noticia"),
                ),
              ],
            ),

          ],
        ),
    );
  }

  _openUrl(url) async{
    if(await canLaunch(url)){
      await launch(url, forceWebView: true);
    }else{
      throw "No se puede abrir URL";
    }
  }

}
