import 'package:flutter/material.dart';
import 'package:m12/pertemuan12/pertemuan12_detail_screen.dart';
import 'package:m12/pertemuan12/pertemuan12_provider.dart';
import 'package:provider/provider.dart';

class Pertemuan12Screen extends StatefulWidget {
  const Pertemuan12Screen({super.key});

  @override
  State<Pertemuan12Screen> createState() => _Pertemuan12ScreenState();
}

class _Pertemuan12ScreenState extends State<Pertemuan12Screen> {
  @override
  void initState() {
    Future.microtask(() {
      Provider.of<Pertemuan12Provider>(context, listen: false).initialData();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pertemuan 12'),
      ),
      body: body(context),
    );
  }

  body(BuildContext context) {
    final prov = Provider.of<Pertemuan12Provider>(context);
    if (prov.data == null) {
      return const CircularProgressIndicator();
    } else {
      return Container(
        padding: EdgeInsets.only(bottom: 450),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 5.0,
          children: List.generate(prov.data['data']!.length, (index) {
            var item = prov.data['data']![index];
            return InkWell(
              onTap: () {
                Map<String, dynamic> data = {
                  "cover": item['img'],
                  "model": item['model'],
                  "developer": item['developer'],
                  "desc": item['desc'],
                  "price": item['price'],
                  "rating": item['rating']
                };

                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Pertemuan12ScreenDetail(data: data)));
              },
              child: Container(
                padding: EdgeInsets.only(bottom: 140),
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(item['img']),
                        ),
                        title: Text(item['model']),
                        subtitle: Text(
                          item['developer'],
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            item['desc'].toString().length >= 50
                                ? item['desc'].toString().substring(0, 50) +
                                    '...read more'
                                : item['desc'],
                            style:
                                TextStyle(color: Colors.black.withOpacity(0.6)),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10.0, bottom: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Rp. ${item["price"].toString()},-',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text('Rating ${item["rating"].toString()}'),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.thumb_up),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.share),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      );
    }
  }
}
