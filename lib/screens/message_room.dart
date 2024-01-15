import 'package:flutter/material.dart';

class MessageRoom extends StatefulWidget {
  @override
  _MessageRoomState createState() => _MessageRoomState();
}

class _MessageRoomState extends State<MessageRoom> {
  TextEditingController messageController = TextEditingController();

  List<Widget> chatMessages = [];

  void sendMessage() {
    String message = messageController.text;
    if (message.isNotEmpty) {
      setState(() {
        chatMessages.insert(0, _buildMessage(true, message));
        messageController.clear();
        // Simulate Lavanya's response (replace with actual logic)
        chatMessages.insert(0, _buildMessage(false, "Hello there!"));
      });
    }
  }

  Widget _buildMessage(bool isUser, String message) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment:
        isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isUser)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                    'https://example.com/lavanya_profile_photo.jpg'),
              ),
            ),
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.7,
            ),
            padding: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: isUser ? Color(0xFFF1B0F0) : Color(0xC3F86D72),
            ),
            child: Text(
              message,
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          if (isUser)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                    'https://example.com/user_profile_photo.jpg'),
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage(
                  "https://4ec5a3ca-a-258b6f3f-s-sites.googlegroups.com/a/goodmen.info/workcanada/assistants/female_generic_profile.png"),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Swetha",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  "online",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert_outlined,
              size: 26,
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.8,
              padding: const EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFFE1E1E1),
              ),
              child: TextFormField(
                controller: messageController,
                decoration: InputDecoration(
                  hintText: "Message",
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(width: 10),
            FloatingActionButton(
              backgroundColor: Colors.red,
              onPressed: sendMessage,
              child: Icon(Icons.send),
            ),
          ],
        ),
      ),
      body: ListView(
        reverse: true,
        children: chatMessages,
      ),
    );
  }
}
