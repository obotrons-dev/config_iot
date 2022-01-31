import 'package:flutter/material.dart';


class Scroll extends StatefulWidget {
  const Scroll({Key key}) : super(key: key);

  @override
  _ScrollState createState() => _ScrollState();
}

class _ScrollState extends State<Scroll> {
  final controller = ScrollController();
  int index = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Scroll"),
      ),
      body: buildList(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_downward),
        onPressed: scrolldown,
      ),
    );
  }


  void scrolldown(){
    final end = controller.position.maxScrollExtent;
    controller.animateTo(end,duration: Duration(seconds: 5),curve: Curves.easeIn);

  }

  Widget buildList() => ListView.builder(
      controller: controller,
      itemCount: 50,
      itemBuilder: (context,index) => ListTile(
        title: Center(
          child: Text(
            '${index + 1}',
            style: TextStyle(fontSize: 32),
          ),
        ),
      ));

}

