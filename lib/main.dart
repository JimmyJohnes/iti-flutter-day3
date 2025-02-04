import 'package:flutter/material.dart';
import 'package:test_project/story_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List people = [
    {"name": "Ankur", "isOnline": false, "lastMessage": "Let's meet tomorrow"},
    {"name": "Stella", "isOnline": true, "lastMessage": "Hey what's up"},
    {
      "name": "Rosy",
      "isOnline": true,
      "lastMessage": "Are you ready for the party.."
    },
    {"name": "Ani", "isOnline": false, "lastMessage": "Let's go have some fun"},
    {"name": "Ani", "isOnline": false, "lastMessage": "Let's go have some fun"},
    {"name": "Ani", "isOnline": false, "lastMessage": "Let's go have some fun"},
    {"name": "Ani", "isOnline": false, "lastMessage": "Let's go have some fun"},
    {"name": "Ani", "isOnline": false, "lastMessage": "Let's go have some fun"},
    {"name": "Ani", "isOnline": false, "lastMessage": "Let's go have some fun"},
    {"name": "Ani", "isOnline": false, "lastMessage": "Let's go have some fun"},
    {"name": "Ani", "isOnline": false, "lastMessage": "Let's go have some fun"},
    {"name": "Ani", "isOnline": false, "lastMessage": "Let's go have some fun"},
    {"name": "Ani", "isOnline": false, "lastMessage": "Let's go have some fun"},
    {"name": "Ani", "isOnline": false, "lastMessage": "Let's go have some fun"},
    {"name": "Ani", "isOnline": false, "lastMessage": "Let's go have some fun"},
    {"name": "Ani", "isOnline": false, "lastMessage": "Let's go have some fun"},
    {"name": "Ani", "isOnline": false, "lastMessage": "Let's go have some fun"},
    {"name": "Ani", "isOnline": false, "lastMessage": "Let's go have some fun"},
    {"name": "Ani", "isOnline": false, "lastMessage": "Let's go have some fun"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Chats",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 32.0),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 26.0,
          ),
        ),
        actions: [
          Icon(
            Icons.camera_alt,
            color: Colors.black,
          ),
          SizedBox(
            width: 15,
          ),
          Icon(
            Icons.message,
            color: Colors.black,
          ),
          SizedBox(
            width: 15,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: ListView(children: [
            Column(
              spacing: 25.0,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 195, 194, 194),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    hintText: "Search",
                  ),
                ),
                StorySlider(people: people),
                ...people.map((item) => Chat(item: item)),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}

class Chat extends StatelessWidget {
  const Chat({super.key, required this.item});
  final dynamic item;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 195, 194, 194),
              radius: 26.0,
              backgroundImage: item["name"] == "+"
                  ? NetworkImage("")
                  : NetworkImage(
                      "https://w7.pngwing.com/pngs/753/432/png-transparent-user-profile-2018-in-sight-user-conference-expo-business-default-business-angle-service-people-thumbnail.png"),
            ),
            Positioned(
              left: 36,
              bottom: 4,
              child: CircleAvatar(
                backgroundColor: item["isOnline"] ? Colors.green : Colors.grey,
                radius: 8,
              ),
            )
          ],
        ),
        SizedBox(
          width: 15,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item["name"],
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            Text(
              item["lastMessage"],
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
            ),
          ],
        )
      ],
    );
  }
}
