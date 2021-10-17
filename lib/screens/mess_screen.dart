import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messenger_app/models/chat.dart';
import 'package:messenger_app/models/story.dart';

class MessScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MessScreen();
  }
}

class _MessScreen extends State<MessScreen> {
  List<UserStory> listStory = [];
  List<ChatUser> listChat = [];

  @override
  void initState() {
    initData();
  }

  initData() {
    listStory.add(UserStory(name: 'Huyen', url: 'images/user1.jpg'));
    listStory.add(UserStory(name: 'Linh', url: 'images/user2.jpg'));
    listStory.add(UserStory(name: 'Huong', url: 'images/user3.jpg'));
    listStory.add(UserStory(name: 'Quynh', url: 'images/user4.jpg'));
    listStory.add(UserStory(name: 'Nga', url: 'images/user5.jpg'));
    listStory.add(UserStory(name: 'Trang', url: 'images/user6.jpg'));
    listChat.add(ChatUser(
        name: 'Thuy Linh',
        url: 'images/user4.jpg',
        chat: 'Hello bro',
        time: '7m'));
    listChat.add(ChatUser(
        name: 'Nhu Quynh',
        url: 'images/user3.jpg',
        chat: 'Em di ngu day',
        time: '27m'));
    listChat.add(ChatUser(
        name: 'Thu Trang',
        url: 'images/user5.jpg',
        chat: 'Anh an com chua',
        time: '46m'));
    listChat.add(ChatUser(
        name: 'Khanh Van',
        url: 'images/user6.jpg',
        chat: 'May gio VN da',
        time: '1h32m'));
    listChat.add(ChatUser(
        name: 'Thuy Trang',
        url: 'images/user7.jpg',
        chat: 'May gio VN da',
        time: '1h32m'));
    listChat.add(ChatUser(
        name: 'Kim Ngan',
        url: 'images/user9.jpg',
        chat: 'May gio VN da',
        time: '1h32m'));
    listChat.add(ChatUser(
        name: 'Khanh Van',
        url: 'images/user1.jpg',
        chat: 'May gio VN da',
        time: '1h32m'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chats"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting"),
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10, right: 20, top: 15),
              child: _buildAppBar(),
            ),
            SizedBox(
              height: 8,
            ),
            Column(
              children: [
                ListView.builder(
                    itemCount: listChat.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Container(
                            width: 56,
                            height: 56,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(listChat[index].url),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                listChat[index].name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Row(
                                children: [
                                  Text(
                                    listChat[index].chat,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(listChat[index].time),
                                ],
                              ),
                            ],
                          ),
                        ],
                      );
                    })
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('images/kvc.jpg'),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Chats",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
          ],
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.camera_alt),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.edit),
            )
          ],
        )
      ],
    );
  }

  Widget _buildSearch() {
    return Container(
      width: double.infinity,
      height: 46,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        cursorColor: Colors.black,
        decoration: InputDecoration(
          hintText: "Search",
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}
