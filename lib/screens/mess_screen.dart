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
    listStory.add(UserStory(name: 'Huyền', url: 'images/user1.jpg'));
    listStory.add(UserStory(name: 'Linh', url: 'images/user2.jpg'));
    listStory.add(UserStory(name: 'Hương', url: 'images/user3.jpg'));
    listStory.add(UserStory(name: 'Quỳnh', url: 'images/user4.jpg'));
    listStory.add(UserStory(name: 'Nga', url: 'images/user5.jpg'));
    listStory.add(UserStory(name: 'Vân', url: 'images/user6.jpg'));
    listChat.add(ChatUser(
        name: 'Thùy Linh',
        url: 'images/user4.jpg',
        chat: 'Hôm qua MU thua 4-2',
        time: '7m'));
    listChat.add(ChatUser(
        name: 'Như Quỳnh',
        url: 'images/user3.jpg',
        chat: 'Em đi ngủ đây',
        time: '27m'));
    listChat.add(ChatUser(
        name: 'Thu Trang',
        url: 'images/user5.jpg',
        chat: 'Bún đậu ăn ngon vch',
        time: '46m'));
    listChat.add(ChatUser(
        name: 'Khánh Vân',
        url: 'images/user6.jpg',
        chat: 'Khi nào Việt Nam đá nhỉ',
        time: '1h39m'));
    listChat.add(ChatUser(
        name: 'Thùy Trang',
        url: 'images/user7.jpg',
        chat: 'Kante la cầu thủ Pháp',
        time: '4h22m'));
    listChat.add(ChatUser(
        name: 'Kim Ngân',
        url: 'images/user9.jpg',
        chat: 'Chịu rồi',
        time: 'Th 7'));
    listChat.add(ChatUser(
        name: 'Kiều Mai',
        url: 'images/user1.jpg',
        chat: 'Máy bị làm sao ấyy',
        time: 'Th 6'));
    listChat.add(ChatUser(
        name: 'Thùy Mỵ',
        url: 'images/user1.jpg',
        chat: 'Hỏng rồi. Không vào được nữa',
        time: 'Th 5'));
    listChat.add(ChatUser(
        name: 'Yến Hoàng',
        url: 'images/user2.jpg',
        chat: 'Không biết bao giờ mới được lên Hà Nội',
        time: 'Th 5'));
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
            _buildSearch(),
            SizedBox(height: 10,),
            _buildChats(),
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
    return Padding(
      padding: EdgeInsets.all(6),
      child: Container(
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
      ),
    );
  }

  Widget _buildChats(){
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: listChat.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
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
                  ),
                );
              })
        ],
      ),
    );
  }
}
