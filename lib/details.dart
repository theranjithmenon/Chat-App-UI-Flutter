import 'package:flutter/Material.dart';

class PersonDetails extends StatelessWidget {
  List personName;
  List picture;
  List time;
  List message;
  int index;

  PersonDetails(
      {Key? key,
      required this.picture,
      required this.personName,
      required this.time,
      required this.message,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.phone)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.camera_alt)),
      ], title: Text(personName[index])),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 65,
                      backgroundImage: NetworkImage(picture[index]),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Last message ${time[index]}",
                      style: const TextStyle(fontWeight: FontWeight.w300),
                    )
                  ],
                ),
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(25)),
              child: Text(message[index]),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[300], borderRadius: BorderRadius.circular(25)),
              child: Row(
                children: [
                  IconButton(onPressed: (){}, icon: const Icon(Icons.emoji_emotions)),
                  const SizedBox(
                    width: 170,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Message",
                        border: InputBorder.none
                      ),
                    ),
                  ),
                  const Spacer(),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.camera_alt)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.mic)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.send))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
