import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MessengerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 20.0,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://watanimg.elwatannews.com/image_archive/648x316/8897638911551812653.jpg"),
            ),
            SizedBox(
              width: 15.0,
            ),
            Text(
              "Chats",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 15.0,
              child: Icon(
                Icons.camera_alt,
                color: Colors.white,
                size: 16.0,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 15.0,
              child: Icon(
                Icons.edit,
                color: Colors.white,
                size: 16.0,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Colors.grey[300],
                ),
                child: Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text("Search"),
                  ],
                ),
              ),
              SizedBox(
                height: 12.0,
              ),
              Container(
                height: 100.0,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => buildStory(),
                  separatorBuilder: (context, index) => SizedBox(width: 20.0,),
                  itemCount: 8,
                  ),
              ),
              
                ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: ((context, index) => buildChat()), 
                  separatorBuilder: ((context, index) => SizedBox(height: 10.0,)),
                   itemCount: 15)
            ],
          ),
        ),
      ),
    );
  }

  Widget buildStory() => Container(
        width: 50.0,
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://th.bing.com/th/id/OIP.ZT-Tw8tYy38htqch69vsGQAAAA?pid=ImgDet&rs=1"),
                  radius: 25.0,
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 6.0,
                ),
                CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: 5.0,
                ),
              ],
            ),
            SizedBox(
              height: 6.0,
            ),
            Text(
              "Unknown",
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 11.0),
            )
          ],
        ),
      );
  Widget buildChat() {
    return Row(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://th.bing.com/th/id/OIP.ZT-Tw8tYy38htqch69vsGQAAAA?pid=ImgDet&rs=1"),
              radius: 25.0,
            ),
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 6.0,
            ),
            CircleAvatar(
              backgroundColor: Colors.green,
              radius: 5.0,
            ),
          ],
        ),
        SizedBox(
          width: 20.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Unknown",
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600),
            ),
            Row(
              children: [
                Text("Hello My name is ...."),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Container(
                    width: 7.0,
                    height: 5.0,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Text("02:15 PM"),
              ],
            )
          ],
        ),
      ],
    );
  }
}
