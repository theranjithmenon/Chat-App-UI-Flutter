import 'package:flutter/Material.dart';

class MessageBox extends StatefulWidget {
  List personName;
  List picture;
  List time;
  List message;
  int index;

  MessageBox(
      {Key? key,
      required this.picture,
      required this.personName,
      required this.time,
      required this.message,
      required this.index})
      : super(key: key);

  @override
  State<MessageBox> createState() => _MessageBoxState();
}

class _MessageBoxState extends State<MessageBox> {
  String myMessage = "";
  final textController = TextEditingController();
  bool myMessageDisplay = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.phone)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.camera_alt)),
          ],
          title: GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: SizedBox(
                          height: 500,
                          width: 150,
                          child: Column(
                            children: [
                              Image(
                                image:
                                    NetworkImage(widget.picture[widget.index]),
                                fit: BoxFit.cover,
                              ),
                              Text(widget.personName[widget.index])
                            ],
                          ),
                        ),
                      );
                    });
              },
              child: Text(widget.personName[widget.index]))),
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
                      backgroundImage:
                          NetworkImage(widget.picture[widget.index]),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Last message ${widget.time[widget.index]}",
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
              child: Text(widget.message[widget.index]),
            ),
            Row(
              children: [
                Spacer(),
                Visibility(
                    visible: myMessageDisplay,
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(25)),
                      child: Text(myMessage),
                    )),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(25)),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.emoji_emotions)),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: TextField(
                      controller: textController,
                      decoration: const InputDecoration(
                          hintText: "Message", border: InputBorder.none),
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.camera_alt)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.mic)),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          myMessage = textController.text;
                          myMessageDisplay = true;
                          textController.text = "";
                        });
                      },
                      icon: const Icon(Icons.send))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
