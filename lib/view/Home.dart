import 'package:flutter/material.dart';
import 'package:noticias_ama/view/NewsCard.dart';
import 'package:noticias_ama/model/Noticia.dart';
import 'dart:async';
import 'package:noticias_ama/controller/Requests.dart';
import 'package:async_loader/async_loader.dart';

class Home extends StatefulWidget{

  @override
  State createState() {
    return new _homeState();
  }
}

class _homeState extends State<Home>{
  final GlobalKey<AsyncLoaderState> _asyncLoaderState =
  new GlobalKey<AsyncLoaderState>();

  getMessage() async{
    return new Future.delayed(Duration(seconds: 5), ()=> "Cargado Correctamente");
  }

  obteniendoDatosImportantes() async{
    var recursos = await Requests.peticionRecursos();
    print("Recursos: " + recursos.toString());
    return await Requests.peticionNoticias();
  }

  @override
  Widget build(BuildContext context) {

    var _asyncLoader = new AsyncLoader(
      key: _asyncLoaderState,
      initState: () async => await obteniendoDatosImportantes(),
      renderLoad: () => Center(child: CircularProgressIndicator(),),
      renderError: ([error])=> Center(child: Text("Ocurrio un error en la carga"),),
      renderSuccess: ({data}) => Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView.builder(
            itemBuilder: (BuildContext , index){
              return NewsCard(data[index]);
            },
            itemCount: data.length,
        ),
      ),
    );

    return new Scaffold(
      appBar: AppBar(
        title: new Text("Noticias A.M.A."),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (seleccion){

            },
            itemBuilder: (BuildContext context){

            },
          )
        ],
      ),
      body: _asyncLoader

      /*NewsCard(new Noticia(
        titulo: "Mi noticia",
        descripcion: "Descripcion de la noticia",
        imagenUrl: "https://cbsnews2.cbsistatic.com/hub/i/r/2019/06/13/af3ced42-dfcf-4c71-a7f0-7292de319e55/thumbnail/1200x630/8d031e85cb59cf2ce39d864fb8353c9d/ap-19164657680721.jpg",
      )),*/

    );


  }

}