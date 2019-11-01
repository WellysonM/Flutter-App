import 'package:flutter/material.dart';
import 'package:primeiro_projeto_flutter/pages/DragNDropPage.dart';
import 'package:primeiro_projeto_flutter/pages/ListViewHor.dart';
import 'package:toast/toast.dart';
import '../layout.dart';

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
          children: <Widget>[
            SizedBox(height: 100),
            Text('Aula Afranio',
                style: TextStyle(color: Colors.black, fontSize: 24)),
            SizedBox(height: 15),
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset('assets/images/4.jpg', scale: 1.5),
            ),
            _botoes(context),
          ],
        )),
      ),
    );
    return Layout.getContent(context, content);
  }
}

_botoes(BuildContext context) {
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
            _botao("Snack", context, _snack),
            _botao("Toast", context, _toast),
            _botao("Caixa de Diálogos", context, _dialog)
          ]),
    ],
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
  print(x);
}

_snack() {}

_toast() {
  print("toast");
}

_dialog() {}
