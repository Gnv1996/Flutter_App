import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Simple Chat UI',
    home: ChatScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  List<ChatMessage> _messages = [];

  void _handleSubmitted(String text) {
    _controller.clear();
    ChatMessage message = ChatMessage(
      text: text,
      // For simplicity, assume user is always the sender
      isUser: true,
    );
    setState(() {
      _messages.insert(0, message);
    });

    // Simulate responses based on user's message
    if (text.toLowerCase() == "hii") {
      _handleResponse("How can I help you Dr. Bugu?");
    }
  }

  void _handleResponse(String text) {
    ChatMessage message = ChatMessage(
      text: text,
      isUser: false, // Customer support responds, not the user
    );
    setState(() {
      _messages.insert(0, message);
    });
  }

  Widget _buildTextComposer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      margin: EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: "Type a message",
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
              ),
              onSubmitted: _handleSubmitted,
            ),
          ),
          SizedBox(width: 8.0),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () => _handleSubmitted(_controller.text),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Customer Support Chat"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (_, int index) => _messages[index],
            ),
          ),
          Divider(height: 1.0),
          _buildTextComposer(),
        ],
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isUser;

  ChatMessage({required this.text, this.isUser = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: <Widget>[
          if (!isUser) ...[
            CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text(
                "C",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(width: 8.0),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  isUser ? "You" : "Customer Support",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isUser ? Colors.blue : Colors.green,
                  ),
                ),
                SizedBox(height: 4.0),
                Container(
                  padding: EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: isUser
                        ? Colors.blue.withOpacity(0.1)
                        : Colors.green.withOpacity(0.1),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.0),
                      topRight: Radius.circular(12.0),
                      bottomLeft:
                          isUser ? Radius.circular(12.0) : Radius.circular(0.0),
                      bottomRight:
                          isUser ? Radius.circular(0.0) : Radius.circular(12.0),
                    ),
                  ),
                  child: Text(
                    text,
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
