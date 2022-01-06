import 'package:flutter/material.dart';

import '../settings/settings_view.dart';
import 'book.dart';
import 'book_details_view.dart';

/// Displays a list of SampleItems.
class BookListView extends StatelessWidget {
  const BookListView({
    Key? key,
    this.items = const [
      Book('Czysta architektura'),
      Book('NoSQL Przyjazny przewodnik'),
      Book('Spark Zaawansowana analiza danych'),
      Book('Australia gdzie kwiaty rodzą się z ognia'),
      Book('Wzorce Projektowe')
    ],
  }) : super(key: key);

  static const routeName = '/';

  final List<Book> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Books'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to the settings page. If the user leaves and returns
              // to the app after it has been killed while running in the
              // background, the navigation stack is restored.
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),

      // To work with lists that may contain a large number of items, it’s best
      // to use the ListView.builder constructor.
      //
      // In contrast to the default ListView constructor, which requires
      // building all Widgets up front, the ListView.builder constructor lazily
      // builds Widgets as they’re scrolled into view.
      body: ListView.builder(
        // Providing a restorationId allows the ListView to restore the
        // scroll position when a user leaves and returns to the app after it
        // has been killed while running in the background.
        restorationId: 'sampleItemListView',
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];

          return ListTile(
              title: Text('Book ${item.name}'),
              leading: const CircleAvatar(
                // Display the Flutter Logo image asset.
                foregroundImage: AssetImage('assets/images/flutter_logo.png'),
              ),
              onTap: () {
                // Navigate to the details page. If the user leaves and returns to
                // the app after it has been killed while running in the
                // background, the navigation stack is restored.
                Navigator.restorablePushNamed(
                  context,
                  BookDetailsView.routeName,
                );
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SecondRoute(items: items)),
          );
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}

//new item

class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key, required List<Book> items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Book"),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Book name',
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Add'),
                  )),
              Padding(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Go back!'),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
