import 'package:flutter/material.dart';
import 'package:halen_customer_app/components/appBar/poppable_title_cart_appbar.dart';
import 'package:halen_customer_app/screens/messages/models.dart';
import 'package:halen_customer_app/constants/colors.dart';

class MessageChatPage extends StatefulWidget {
  const MessageChatPage({super.key, required this.user});

  final User user;

  @override
  State<MessageChatPage> createState() => _MessageChatPageState();
}

class _MessageChatPageState extends State<MessageChatPage> {
  List messages = messagesTestData;

  TextEditingController messageInputController = TextEditingController();
  ScrollController chatScrollController = ScrollController();

  @override
  dispose() {
    messageInputController.dispose();
    chatScrollController.dispose();
    super.dispose();
  }

  void _scrollDown() {
    chatScrollController.jumpTo(chatScrollController.position.maxScrollExtent);
  }

  _chatBubble(Message message, bool isMe, bool isSameUser) {
    if (isMe) {
      return Column(
        children: <Widget>[
          !isSameUser
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      message.time,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black45,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: AppColors.primaryColor1,
                        backgroundImage: AssetImage(message.sender.imageUrl),
                      ),
                    ),
                  ],
                )
              : Container(),
          Container(
            alignment: Alignment.topRight,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.80,
              ),
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Text(
                message.text,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      );
    } else {
      return Column(
        children: <Widget>[
          !isSameUser
              ? Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: AppColors.primaryColor1,
                        backgroundImage: AssetImage(message.sender.imageUrl),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      message.time,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black45,
                      ),
                    ),
                  ],
                )
              : Container(),
          Container(
            alignment: Alignment.topLeft,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.80,
              ),
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Text(
                message.text,
                style: const TextStyle(
                  color: Colors.black54,
                ),
              ),
            ),
          ),
        ],
      );
    }
  }

  _sendMessageArea() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      height: 70,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.photo),
            iconSize: 25,
            color: Theme.of(context).primaryColor,
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              controller: messageInputController,
              decoration: const InputDecoration.collapsed(
                hintText: 'Send a message..',
              ),
              textCapitalization: TextCapitalization.sentences,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            iconSize: 25,
            color: Theme.of(context).primaryColor,
            onPressed: () {
              setState(() {
                messages.add(Message(
                    sender: messagesTestCurrentUser,
                    time: "8:88",
                    text: messageInputController.text,
                    unread: true));
              });
              Future.delayed(const Duration(milliseconds: 100), () {
                _scrollDown();
              });
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int prevUserId = 0;

    return SafeArea(
        child: Scaffold(
            body: Column(
      children: <Widget>[
        const PoppableTitleCartAppBar(
          title: "Chat",
        ),
        Expanded(
          child: ListView.builder(
            // reverse: true,
            controller: chatScrollController,
            padding: const EdgeInsets.all(20),
            itemCount: messages.length,
            itemBuilder: (BuildContext context, int index) {
              final Message message = messages[index];
              final bool isMe = message.sender.id == messagesTestCurrentUser.id;
              final bool isSameUser = prevUserId == message.sender.id;
              prevUserId = message.sender.id;
              return _chatBubble(message, isMe, isSameUser);
            },
          ),
        ),
        _sendMessageArea(),
      ],
    )));
  }
}
