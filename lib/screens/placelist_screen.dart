import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './addplace_screen.dart';
import '../providers/greatplaces.dart';

class PlaceListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Places'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
              }),
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatPLaces>(context, listen: false)
            .fetchAndSetPlaces(),
        builder: (ctx, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Consumer<GreatPLaces>(
                child: Center(
                  child: Text('No place found , Add places'),
                ),
                builder: (ctx, greatPLaces, ch) => greatPLaces.itmes.length <= 0
                    ? ch
                    : ListView.builder(
                        itemCount: greatPLaces.itmes.length,
                        itemBuilder: (ctx, i) => ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                FileImage(greatPLaces.itmes[i].image),
                          ),
                          title: Text(greatPLaces.itmes[i].title),
                          onTap: () {
                            // go to detail page.
                          },
                        ),
                      ),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
        },
        child: Icon(Icons.add_a_photo),
        backgroundColor: Colors.green,
      ),
    );
  }
}
