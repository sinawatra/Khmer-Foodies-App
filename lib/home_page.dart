import 'dart:convert';
import 'package:flutter/material.dart';
import 'banner_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<List<Widget>> createList(BuildContext context) async {
    List<Widget> items = [];
    String dataString =
        await DefaultAssetBundle.of(context).loadString("assets/data.json");
    List<dynamic> dataJSON = jsonDecode(dataString);

    for (var object in dataJSON) {
      String finalString = "";
      // Fixed: correct property name and object reference
      List<dynamic> dataList =
          object["placeItems"]; // Changed from "placeImages" to "placeItems"
      // Fixed: forEach syntax and variable names
      dataList.forEach((item) {
        // Changed 'items' to 'item'
        finalString = finalString + item + " | "; // Added semicolon
      });

      items.add(
        Padding(
          padding: EdgeInsets.all(2.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white70,
                    spreadRadius: 2.0,
                    blurRadius: 5,
                  )
                ]),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                  child: Image.asset(
                    object["placeImage"],
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  // Added Expanded to prevent overflow
                  child: Padding(
                    // Added padding for better spacing
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // Added for better alignment
                      children: [
                        Text(
                          object["placeName"],
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          finalString,
                          style: TextStyle(fontSize: 12, color: Colors.black87),
                          maxLines: 1,
                          overflow: TextOverflow
                              .ellipsis, // Added to handle text overflow
                        ),
                        Text(
                          "Min Order: ${object["minOrder"]}", // Added minimum order display
                          style: TextStyle(fontSize: 12, color: Colors.black87),
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Removed MaterialApp as it should be in the root widget
      body: SafeArea(
        child: Column(
          // Changed structure to make ListView work properly
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 5, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.menu),
                  ),
                  const Text(
                    "Khmer Foodies",
                    style: TextStyle(fontSize: 30, fontFamily: "samantha"),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.person),
                  ),
                ],
              ),
            ),
            const BannerWidget(),
            Expanded(
              // Added Expanded to allow ListView to scroll
              child: FutureBuilder<List<Widget>>(
                future: createList(context),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Widget>> snapshot) {
                  if (snapshot.hasData) {
                    return ListView(
                      children: snapshot.data ??
                          [], // Use the actual data from snapshot
                    );
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.fastfood,
          color: Colors.black,
        ),backgroundColor: Colors.white
      ),
    );
  }
}
