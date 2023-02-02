import 'package:flutter/material.dart';
import 'package:task_one/details.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List personName = ["Laurent", "Tracy", "Claire", "Joe", "Mark", "Williams"];
    List time = ["20:18", "19:22", "14:34", "11:05", "09:46", "08:15"];
    List message = [
      "How about meeting tomorrow?",
      "I love that idea,it's great!",
      "I wasn't aware of that. \nLet me check",
      "Flutter just released 3.7 officially.\nShould I go for it?",
      "It totally makes sense to get some\nextra day-off",
      "It has been re-scheduled to next \nSaturday 7.30 PM"
    ];
    List picture = [
      "https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80",
      "https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=388&q=80",
      "https://images.unsplash.com/photo-1531746020798-e6953c6e8e04?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80",
      "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
      "https://images.unsplash.com/photo-1552374196-c4e7ffc6e126?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
      "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80"
    ];
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.message),
      ),
      appBar: AppBar(
        title: const Text("Messages"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: ListView.builder(
            itemCount: personName.length,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(picture[index]),
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  personName[index],
                                  style: const TextStyle(fontSize: 18),
                                ),
                                const SizedBox(
                                  width: 25,
                                ),
                                Text(
                                  time[index],
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300),
                                )
                              ],
                            ),
                            Text(message[index],
                                style: const TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w400))
                          ],
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MessageBox(
                                            picture: picture,
                                            personName: personName,
                                            time: time,
                                            message: message,
                                            index: index,
                                          )));
                            },
                            icon: const Icon(Icons.arrow_forward_ios, size: 15))
                      ],
                    ),
                    const Divider(),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
