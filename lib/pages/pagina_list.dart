import 'package:flutter/material.dart';
import 'package:primeiro_projeto_flutter/pages/ListViewHor.dart';

class Paisagem {
  String nome;
  String foto;

  Paisagem(this.nome, this.foto);
}

class PaginaList extends StatefulWidget {
  @override
  _PaginaListState createState() => _PaginaListState();
}

class _PaginaListState extends State<PaginaList> {
  bool gridView = true;
  List<Paisagem> lista = [
    Paisagem("Miranha", "assets/images/4.jpg"),
    Paisagem("Bob", "imagens/bob.jpg"),
    Paisagem("Sonic Cage", "imagens/sonic.jpg"),
    Paisagem("knuckles", "imagens/knuckles.png"),
    Paisagem("Dora Marombeira", "imagens/dora.jpg")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Página ListView"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {
              setState(() {
                gridView = false;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.grid_on),
            onPressed: () {
              setState(() {
                gridView = true;
              });
            },
          )
        ],
      ),
      body: _body(),
    );
  }

  _body() {
    if (gridView == true) {
      return GridView.builder(
        //itemExtent: 350,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemCount: lista.length,
        itemBuilder: (context, index) {
          Paisagem p = lista[index];
          //return _imagens(p.foto);
          return Stack(
            fit: StackFit.expand,
            children: <Widget>[
              _imagens(p.foto),
              Align(
                alignment: Alignment(-0.5, -1),
                child: Container(
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.black45,
                      borderRadius: BorderRadius.circular(30)),
                  child: Text(
                    p.nome,
                    style: TextStyle(fontSize: 25, color: Colors.yellow),
                  ),
                ),
              )
            ],
          );
        },
      );
    } else {
      return ListView.builder(
        itemExtent: 350,
        // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemCount: lista.length,
        itemBuilder: (context, index) {
          Paisagem p = lista[index];
          //return _imagens(p.foto);
          return GestureDetector(
            onTap: () {
              _onClickNavega(context, ListViewHor());
            },
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                _imagens(p.foto),
                Align(
                  alignment: Alignment(-0.5, -1),
                  child: Container(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.circular(30)),
                    child: Text(
                      p.nome,
                      style: TextStyle(fontSize: 25, color: Colors.yellow),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      );
    }
  }

  _onClickNavega(BuildContext context, Widget pagina) async {
    //print("Ola mundo");//tipos e null
    String x = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext) {
      return pagina;
    }));
    print(x);
  }

  static _imagens(String caminho) {
    return Image.asset(
      caminho,
      width: 300,
      height: 300,
      fit: BoxFit.cover, //fill contain
    );
    //return Image.network("caminho");
  }
}
