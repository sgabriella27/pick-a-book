import 'package:flutter/material.dart';
import 'package:qualif_flutter_ga/models/book.dart';
import 'package:qualif_flutter_ga/views/pages/item-detail.dart';

class ItemPage extends StatefulWidget {
  ItemPage({Key? key}) : super(key: key);

  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  var books = [
    Book('1.jpg', 'Five on a Treasure Island', 2.00),
    Book('2.jpg', 'Appointment with Death', 3.00),
    Book('3.jpg', 'The Seven Dials Mistery', 4.00),
    Book('4.jpg', 'Autumn in Paris', 5.00),
    Book('5.jpg', 'Charlie and The Chocolate Factory', 6.00)
  ];

  void detail(book) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ItemDetailPage(book);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
        title: Text('Item Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            for (var book in books)
              InkWell(
                onTap: () => detail(book),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/' + book.img,
                          width: 100,
                        ),
                        SizedBox(
                          width: 32,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                book.name,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 18),
                              ),
                              Text('\$' + book.price.toString()),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
