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
    return DefaultTabController(
      length: 2, // Specify the number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  // Icon user pressed
                },
                icon: Icon(Icons.account_circle, color: Colors.white, size: 30),
              ),
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
              IconButton(
                onPressed: () {
                  // Icon settings pressed
                },
                icon: Icon(Icons.settings, color: Colors.white, size: 30),
              )
            ],
          ),
          centerTitle: false, // Centering of the title is disabled
          backgroundColor: Colors.black,
          bottom: TabBar(
            tabs: [
              Tab(text: "For you"),
              Tab(text: "Following"),
            ],
            indicatorColor: Colors.blue,
            labelColor: Colors.white, // Set the text color for the selected tab
            unselectedLabelColor: Colors.grey, // Set the text color for unselected tabs
          ),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Container(
                  color: Colors.black,
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildPostContent(
                        username: 'John Angelo Gamboa',
                        email: '@jjgamboa',
                        timePosted: '2 hours ago',
                        content: 'This is a sample post. Hello, world!',
                      ),
                      SizedBox(height: 20), // Add vertical space between posts
                      _buildPostContent(
                        username: 'Cj Macapagal',
                        email: '@cjmacapagal',
                        timePosted: '1 day ago',
                        content: 'MURIT YU!!',
                      ),
                      SizedBox(height: 20), // Add vertical space between posts
                      _buildPostContent(
                        username: 'Calvin Ocampo',
                        email: '@ocampocalvin',
                        timePosted: '1 day ago',
                        content: Image.network('https://media.sproutsocial.com/uploads/meme-example.jpg'), // Example of using NetworkImage for web image
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  // Home icon pressed
                },
                icon: Icon(Icons.home, color: Colors.white),
              ),
              IconButton(
                onPressed: () {
                  // Search icon pressed
                },
                icon: Icon(Icons.search, color: Colors.white),
              ),
              IconButton(
                onPressed: () {
                  // Indeterminate checkbox icon pressed
                },
                icon: Icon(Icons.indeterminate_check_box, color: Colors.white),
              ),
              IconButton(
                onPressed: () {
                  // Notifications icon pressed
                },
                icon: Icon(Icons.notifications_outlined, color: Colors.white),
              ),
              IconButton(
                onPressed: () {
                  // Mail icon pressed
                },
                icon: Icon(Icons.mail_outline_rounded, color: Colors.white),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add your functionality here
          },
          child: Icon(Icons.add,color: Colors.white,),
          backgroundColor: Colors.blue, // Set background color to blue
          shape: CircleBorder(), // Make the button round
        ),
      ),
    );
  }

  Widget _buildPostContent({
    required String username,
    required String email,
    required String timePosted,
    required dynamic content, // Changed type to dynamic to accept both String and NetworkImage
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                // User icon pressed
              },
              icon: Icon(Icons.account_circle, color: Colors.white, size: 50),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '$username ',
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(Icons.verified, color: Colors.blue, size: 20), // Icon user
                      Text(
                        '$email',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(width: 10),
                      Row(
                        children: [
                          Text(
                            timePosted,
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(width: 5),
                          PopupMenuButton(
                            icon: Icon(Icons.more_horiz, color: Colors.white),
                            itemBuilder: (context) => [
                              PopupMenuItem(
                                child: Text('Option 1'),
                              ),
                              PopupMenuItem(
                                child: Text('Option 2'),
                              ),
                              PopupMenuItem(
                                child: Text('Option 3'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  content is String // Check if content is a String
                      ? Text(
                    content,
                    style: TextStyle(color: Colors.white),
                  ) // Display text content
                      : content, // Display image content
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {
                          // Like icon pressed
                        },
                        icon: Icon(Icons.chat_bubble_outline_rounded, color: Colors.white, size: 17,),
                      ),
                      IconButton(
                        onPressed: () {
                          // Comment icon pressed
                        },
                        icon: Icon(Icons.repeat, color: Colors.white, size: 17,),
                      ),
                      IconButton(
                        onPressed: () {
                          // Favorite icon pressed
                        },
                        icon: Icon(Icons.favorite_border, color: Colors.white, size: 17,),
                      ),
                      IconButton(
                        onPressed: () {
                          // Share icon pressed
                        },
                        icon: Icon(Icons.analytics_outlined, color: Colors.white, size: 17,),
                      ),
                      IconButton(
                        onPressed: () {
                          // Bookmark icon pressed
                        },
                        icon: Icon(Icons.bookmark_border, color: Colors.white, size: 17,),
                      ),
                      IconButton(
                        onPressed: () {
                          // Share icon pressed
                        },
                        icon: Icon(Icons.ios_share, color: Colors.white, size: 17,),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
