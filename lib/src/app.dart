// Import flutter helper library
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'models/image_model.dart';
import 'widgets/image_list.dart';
 
class App extends StatefulWidget {
  createState(){
    return AppState();
  }
}

class AppState extends State<App> {
  int counter = 0;
  List<ImageModel> images = [];
  // Fetching our image from the api as json
  void fetchImage() async {
    counter++; // Increment our counter and wait for the response before we render the result
    var response = await get(Uri.parse('https://jsonplaceholder.typicode.com/photos/$counter'));
    // We use json.decode to turn our data into a map
    var imageModel = ImageModel.fromJson(json.decode(response.body));

    setState(() {
      images.add(imageModel);
    });
  }
  // Our build function here
  Widget build(context) {
    return MaterialApp(
    home: Scaffold(
      body: ImageList(images),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed:fetchImage,
      ),
      appBar: AppBar(
        title: Text('Lets see some images!'),
      ),
    ),
  );

  }
}