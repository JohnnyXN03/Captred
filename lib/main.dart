import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/greatplaces.dart';
import './screens/placelist_screen.dart';
import './screens/addplace_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Captred',
        theme: ThemeData(
          primarySwatch: Colors.cyan,
          accentColor: Colors.grey,
        ),
        home: PlaceListScreen(),
        routes: {
          AddPlaceScreen.routeName: (ctx) => AddPlaceScreen(),
        },
      ),
      value: GreatPLaces(),
    );
  }
}
