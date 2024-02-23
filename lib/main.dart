import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(useMaterial3: true),
    debugShowCheckedModeBanner: false,
    home: Homepage(),
  ));
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.account_circle, color: Colors.white, size: 30), // Icon user
            Expanded(
              child: Center(
                child: Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/9/95/Twitter_new_X_logo.png',
                  width: 30,
                  height: 30,
                ), // Twitter logo
              ),
            ),
            SizedBox(width: 20), // Adjust the width to create space between the icon and logo
            Icon(Icons.settings, color: Colors.white, size: 30),
          ],
        ),
        centerTitle: false, // Centering of the title is disabled
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        padding: EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 6.0), // Add padding only at the bottom to create space
              child: Text(
                "For you",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(width: 20), // Add space between "For you" and "Following"
            Text(
              "Following",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}