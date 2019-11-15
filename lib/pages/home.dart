import 'package:flutter/material.dart';
import 'package:primeiro_projeto_flutter/pages/DragNDropPage.dart';
import 'package:primeiro_projeto_flutter/pages/ListViewHor.dart';
import 'package:primeiro_projeto_flutter/pages/pagina_list.dart';
import '../layout.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatefulWidget {
  static final tag = 'home-page';

  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var content = SingleChildScrollView(
      child: Container(
        color: Colors.black12,
        height: MediaQuery.of(context).size.height - 80,
        child: Center(
            child: Column(
                //Row ListView Center SizedBox.expand
                //mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
              _formatacaoTexto(),
              //_imagens("imagens/lago.jpg"),
              Container(
                height: 300,
                margin: EdgeInsets.only(top: 20, bottom: 20), //all
                padding: const EdgeInsets.all(16),
                child: PageView(
                  children: <Widget>[
                    Image.asset('assets/images/4.jpg', scale: 1.5),
                    _imagens("imagens/bob.jpg"),
                    _imagens("imagens/sonic.jpg"),
                    _imagens("imagens/knuckles.png"),
                    _imagens("imagens/dora.jpg")
                  ],
                ),
              ),
              _botoes(),
            ])),
      ),
    );
    return Layout.getContent(context, content);
  }
}

_imagens(String caminho) {
  return Image.asset(
    caminho,
    scale: 1.5,
    width: 300,
    height: 300,
    fit: BoxFit.cover, //fill contain
  );
  //return Image.network("caminho");
}

_formatacaoTexto() {
  return Text(
    "MEMES",
    style: TextStyle(
        fontSize: 30,
        fontFamily: "Times",
        color: Colors.blue,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        decoration: TextDecoration.underline,
        decorationColor: Colors.blue,
        decorationStyle: TextDecorationStyle.double),
  );
}

_botoes() {
  return Builder(
    builder: (context) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //center spaceBetween spaceAround
              children: <Widget>[
                _botao("Lista Horizontal", context,
                    () => _onClickNavega(context, ListViewHor())),
                _botao("DragNDrop", context,
                    () => _onClickNavega(context, DragNDropPage())),
              ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //center spaceBetween spaceAround
              children: <Widget>[
                _botao("Snack", context, () => _snack(context)),
                _botao("Toast", context, () => _toast(context)),
                _botao("Caixa de Diálogos", context, () => _dialog(context))
              ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //center spaceBetween spaceAround
              children: <Widget>[
                _botao("ListView", context,
                    () => _onClickNavega(context, PaginaList()))
              ]),
        ],
      );
    },
  );
}

_botao(String nome, BuildContext context, Function onPressed) {
  return RaisedButton(
    color: Colors.blue,
    child: Text(
      nome,
      style: TextStyle(color: Colors.white, fontSize: 20),
    ),
    onPressed: onPressed,
  );
}

_onClickNavega(BuildContext context, Widget pagina) async {
  //print("Ola mundo");//tipos e null
  String x =
      await Navigator.push(context, MaterialPageRoute(builder: (BuildContext) {
    return pagina;
  }));
//print(x);
}

_snack(context) {
  Scaffold.of(context).showSnackBar(SnackBar(
    content: Text("Você clicou"),
    action: SnackBarAction(
      textColor: Colors.yellow,
      label: "OK",
      onPressed: () {
        print("OK");
      },
    ),
  ));
}

_toast(context) {
  Fluttertoast.showToast(
      msg: "Você clicou",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIos: 5,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
      fontSize: 16.0);
}

_dialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          title: Text("Texto"),
          actions: <Widget>[
            FlatButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            FlatButton(
              child: Text("Cancelar"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      );
    },
  );
}
