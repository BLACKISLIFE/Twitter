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
            Icon(Icons.settings, color: Colors.white, size: 30)
          ],

        ),

        centerTitle: false, // Centering of the title is disabled
        backgroundColor: Colors.black,
      ),
    bottom: TabBar(
    tabs: [
    Tab(text: "For you"),
    Tab(text: "Following"),
    ],
      body: Container(
        color: Colors.black,
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPostContent(
              username: 'John Doe',
              email: 'john.doe@example.com',
              timePosted: '2 hours ago',
              content: 'This is a sample post. Hello, world!',
            ),
            SizedBox(height: 20), // Add vertical space between posts
            _buildPostContent(
              username: 'Jane Smith',
              email: 'jane.smith@example.com',
              timePosted: '1 day ago',
              content: 'Another sample post for demonstration.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPostContent({
    required String username,
    required String email,
    required String timePosted,
    required String content,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.account_circle, color: Colors.white, size: 50), // User icon
            SizedBox(width: 10),
            SizedBox(height: 50),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '$username ',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      '$email',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(width: 10),
                    Text(
                      timePosted,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 10),
        Text(
          content,
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.favorite_border, color: Colors.white), // Like icon
                SizedBox(width: 5),
              ],
            ),
            Row(
              children: [
                Icon(Icons.chat_bubble_outline_rounded, color: Colors.white), // Comment icon
                SizedBox(width: 5),
              ],
            ),
            Row(
              children: [
                Icon(Icons.repeat_one_sharp, color: Colors.white), // Share icon
                SizedBox(width: 5),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
