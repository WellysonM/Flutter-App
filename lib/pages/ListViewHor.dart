import 'package:flutter/material.dart';
import 'package:primeiro_projeto_flutter/pages/home.dart';

import '../layout.dart';

class ListViewHor extends StatefulWidget {
  static final tag = 'ListViewHor-page';

  ListViewHor({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ListViewHorState createState() => _ListViewHorState();
}

class _ListViewHorState extends State<ListViewHor> {
  @override
  Widget build(BuildContext context) {
    ListView content = ListView(
      physics: PageScrollPhysics(),
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        Container(
          color: Colors.blue[100],
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: 100),
                Text('Pagina 1',
                    style: TextStyle(color: Colors.black, fontSize: 24)),
                SizedBox(height: 15),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset('assets/images/1.jpg', scale: 1.5),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(HomePage.tag);
                  },
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text('Pagina Inicial'),
                ),
              ],
            ),
          ),
        ),
        Container(
          color: Colors.indigoAccent[100],
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: 100),
                Text('Pagina 2',
                    style: TextStyle(color: Colors.black, fontSize: 24)),
                SizedBox(height: 15),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset('assets/images/2.png', scale: 1.5),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(HomePage.tag);
                  },
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text('Pagina Inicial'),
                ),
              ],
            ),
          ),
        ),
        Container(
          color: Colors.yellow[100],
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: 100),
                Text('Pagina 3',
                    style: TextStyle(color: Colors.black, fontSize: 24)),
                SizedBox(height: 15),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset('assets/images/3.jpg', scale: 1.5),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(HomePage.tag);
                  },
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text('Pagina Inicial'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
    return Layout.getContent(context, content);
  }
}
