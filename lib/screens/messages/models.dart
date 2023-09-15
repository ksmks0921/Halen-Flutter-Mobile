class User {
  final int id;
  final String name;
  final String imageUrl;
  final bool isOnline;

  User({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.isOnline,
  });
}

final User messagesTestCurrentUser = User(
  id: 0,
  name: 'Edward',
  imageUrl: 'assets/images/illustrations/profile_image.png',
  isOnline: true,
);

// USERS
final User messagesTestUser0 = User(
  id: 1,
  name: 'Alexa',
  imageUrl: 'assets/images/illustrations/profile_image.png',
  isOnline: true,
);
final User messagesTestUser1 = User(
  id: 2,
  name: 'Blake',
  imageUrl: 'assets/images/illustrations/profile_image.png',
  isOnline: true,
);
final User messagesTestUser2 = User(
  id: 3,
  name: 'Caroline',
  imageUrl: 'assets/images/illustrations/profile_image.png',
  isOnline: false,
);
final User messagesTestUser3 = User(
  id: 4,
  name: 'Derek',
  imageUrl: 'assets/images/illustrations/profile_image.png',
  isOnline: false,
);
final User messagesTestUser4 = User(
  id: 5,
  name: 'Esther',
  imageUrl: 'assets/images/illustrations/profile_image.png',
  isOnline: true,
);
final User messagesTestUser5 = User(
  id: 6,
  name: 'Frank',
  imageUrl: 'assets/images/illustrations/profile_image.png',
  isOnline: false,
);
final User messagesTestUser6 = User(
  id: 7,
  name: 'Gretchen',
  imageUrl: 'assets/images/illustrations/profile_image.png',
  isOnline: false,
);
final User messagesTestUser7 = User(
  id: 8,
  name: 'Henry',
  imageUrl: 'assets/images/illustrations/profile_image.png',
  isOnline: false,
);

class Message {
  final User sender;
  final String time;
  final String text;
  final bool unread;

  Message({
    required this.sender,
    required this.time,
    required this.text,
    required this.unread,
  });
}

List<Message> chatsTestData = [
  Message(
    sender: messagesTestUser0,
    time: '5:30 PM',
    text: 'Hey I\'m here',
    unread: true,
  ),
  Message(
    sender: messagesTestUser1,
    time: '4:30 PM',
    text: 'Your ride is outside',
    unread: true,
  ),
  Message(
    sender: messagesTestUser2,
    time: '3:30 PM',
    text: 'I\'m on park and center dr. ',
    unread: false,
  ),
  Message(
    sender: messagesTestUser3,
    time: '2:30 PM',
    text: 'Hello your order is here',
    unread: true,
  ),
  Message(
    sender: messagesTestUser4,
    time: '1:30 PM',
    text: 'Are you home?',
    unread: false,
  ),
  Message(
    sender: messagesTestUser5,
    time: '12:30 PM',
    text: 'I\'m waiting outside',
    unread: false,
  ),
  Message(
    sender: messagesTestUser6,
    time: '11:30 AM',
    text: 'My car is a white mazda',
    unread: false,
  ),
  Message(
    sender: messagesTestUser7,
    time: '12:45 AM',
    text: 'You\'re welcome',
    unread: false,
  ),
];

// EXAMPLE MESSAGES IN CHAT SCREEN
List<Message> messagesTestData = [
  Message(
    sender: messagesTestUser0,
    time: '5:30 PM',
    text: 'Hey are you home',
    unread: true,
  ),
  Message(
    sender: messagesTestCurrentUser,
    time: '5:30 PM',
    text: 'Are you here',
    unread: true,
  ),
  Message(
    sender: messagesTestUser0,
    time: '5:33 PM',
    text: 'Yes',
    unread: true,
  ),
  Message(
    sender: messagesTestUser0,
    time: '5:34 PM',
    text: 'Ok',
    unread: true,
  ),
  Message(
    sender: messagesTestCurrentUser,
    time: '5:35 PM',
    text: 'Can you come to the door',
    unread: true,
  ),
  Message(
    sender: messagesTestUser0,
    time: '5:36 PM',
    text: 'Ok',
    unread: true,
  ),
  Message(
    sender: messagesTestUser0,
    time: '5:37 PM',
    text: 'Is this your correct address',
    unread: true,
  ),
  Message(
    sender: messagesTestCurrentUser,
    time: '5:37 PM',
    text: 'Yes',
    unread: true,
  ),
];
