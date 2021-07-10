import 'package:flutter/material.dart';
import 'package:qualif_flutter_ga/models/book.dart';
import 'package:qualif_flutter_ga/models/comment.dart';
import 'package:qualif_flutter_ga/global.dart' as global;

class ItemDetailPage extends StatefulWidget {
  Book book;
  ItemDetailPage(this.book);

  @override
  _ItemDetailPageState createState() => _ItemDetailPageState(book);
}

class _ItemDetailPageState extends State<ItemDetailPage> {
  var commentCtrl = TextEditingController();
  Book book;
  var comments = <Comment>[];
  _ItemDetailPageState(this.book);

  void onPressed(BuildContext context) {
    if (commentCtrl.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Comment must not be empty!')));
    } else {
      setState(() {
        comments.add(Comment(commentCtrl.text, global.username));
      });
      commentCtrl.text = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.book),
              ),
              Tab(
                icon: Icon(Icons.comment),
              ),
            ],
          ),
          title: Text(book.name),
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/' + book.img,
                        width: 150,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              book.name,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 18),
                            ),
                            Text('\$' + book.price.toString())
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(hintText: 'Comment'),
                          controller: commentCtrl,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => onPressed(context),
                        child: Icon(Icons.send),
                      )
                    ],
                  )
                ],
              ),
            ),
            ListView(
              children: [
                for (var comment in comments)
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(comment.username),
                          Text(comment.comment),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
