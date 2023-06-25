import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Pertemuan12ScreenDetail extends StatelessWidget {
  final Map<String, dynamic> data;
  const Pertemuan12ScreenDetail({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: SingleChildScrollView(
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Image.network(data["cover"]),
                Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [..._getData(data)]),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _getData(Map<String, dynamic> data) {
  List<Widget> _data = [];

  data.forEach((key, value) {
    if (!(key == 'cover')) {
      _data.add(
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(8.0),
              width: 100,
              child: Text(
                key[0].toString().toUpperCase() + key.toString().substring(1),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            if (key == 'desc')
              Expanded(
                  child: Text(
                    "${value}",
                  ),
                )
            else if (key == 'price')
              Text('Rp.${value},-')
            else
              Text('${value}'),
          ],
        ),
      );
    }
  });

  return _data;
}

}
