import 'package:flutter/material.dart';

class StorySlider extends StatefulWidget {
  const StorySlider({super.key, required this.people});
  final List people;
  @override
  State<StorySlider> createState() => _StorySliderState();
}

class _StorySliderState extends State<StorySlider> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Card(item: {"name": "+"}),
          ...widget.people.map((item) => Card(
                item: item,
              ))
        ],
      ),
    );
  }
}

class Card extends StatelessWidget {
  const Card({super.key, required this.item});
  final dynamic item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Stack(
            children: [
              CircleAvatar(
                backgroundColor: const Color.fromARGB(255, 195, 194, 194),
                radius: 26.0,
                backgroundImage: item["name"] == "+"
                    ? NetworkImage(
                        "https://www.freepnglogos.com/uploads/plus-icon/plus-icon-plus-sign-icon-icons-download-22.png")
                    : NetworkImage(
                        "https://w7.pngwing.com/pngs/753/432/png-transparent-user-profile-2018-in-sight-user-conference-expo-business-default-business-angle-service-people-thumbnail.png"),
                child: item["name"] == "+"
                    ? Text(
                        "+",
                        style: TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.bold),
                      )
                    : Text(""),
              ),
              item["isOnline"] == null
                  ? SizedBox(
                      width: 0,
                    )
                  : Positioned(
                      left: 36,
                      bottom: 4,
                      child: CircleAvatar(
                        backgroundColor:
                            item["isOnline"] ? Colors.green : Colors.grey,
                        radius: 8,
                      ),
                    )
            ],
          ),
          item["name"] == "+" ? Text("Your Story") : Text(item["name"]),
        ],
      ),
    );
  }
}
