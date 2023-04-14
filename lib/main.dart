import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late MapController _controller;

  @override
  void initState() {
    super.initState();
    _controller = MapController(
      initMapWithUserPosition: true,
      areaLimit: BoundingBox(
        east: 10.4922941,
        north: 47.8084648,
        south: 45.817995,
        west: 5.9559113,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          'Hariyali',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              child: OSMFlutter(
            controller: _controller,
            isPicker: true,
            onGeoPointClicked: (p0) {
              print(p0.latitude);
            },
            onLocationChanged: (p0) {
              print(p0.latitude);
            },
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.zoom_in),
                onPressed: () {
                  _controller.zoomIn();
                },
              ),
              IconButton(
                icon: Icon(Icons.zoom_out),
                onPressed: () {
                  _controller.zoomOut();
                },
              ),
              IconButton(
                icon: Icon(Icons.location_searching),
                onPressed: () {
                  // Center the map on the user's current location
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
