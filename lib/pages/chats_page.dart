import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:telegram_clone_app/json/chat_json.dart';
import 'package:telegram_clone_app/pages/chat_detail_page.dart';
import 'package:telegram_clone_app/theme/colors.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar:
          PreferredSize(child: getAppBar(), preferredSize: Size.fromHeight(60)),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: greyColor,
      title: Text(
        "Chats",
        style:
            TextStyle(fontSize: 20, color: white, fontWeight: FontWeight.w500),
      ),
      leading: IconButton(
          onPressed: null,
          icon: Text(
            "Edit",
            style: TextStyle(
                fontSize: 16, color: primary, fontWeight: FontWeight.w500),
          )),
      actions: [
        IconButton(
            onPressed: null,
            icon: Icon(
              LineIcons.edit,
              color: primary,
            ))
      ],
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 68,
            decoration: BoxDecoration(color: greyColor),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 38,
                    decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      style: TextStyle(color: white),
                      cursorColor: primary,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            LineIcons.search,
                            color: white.withOpacity(0.3),
                          ),
                          hintText: "Search for messages or users",
                          hintStyle: TextStyle(
                              color: white.withOpacity(0.3), fontSize: 17)),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          getListChats()
        ],
      ),
    );
  }

  Widget getListChats() {
    var size = MediaQuery.of(context).size;
    return Column(
      children: List.generate(chat_data.length, (index) {
        return GestureDetector(
          onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_) => ChatDetailPage(name: chat_data[index]['name'], img: chat_data[index]['img'])));
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 12,right: 12,top: 5),
            child: Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(chat_data[index]['img']),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Container(
                    height: 70,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: (size.width - 40) * 0.6,
                              child: Text(
                                chat_data[index]['name'],
                                style: TextStyle(
                                    fontSize: 16,
                                    color: white,
                                    fontWeight: FontWeight.w600),
                                maxLines: 2,
                              ),
                            ),
                            Text(chat_data[index]['date'],style: TextStyle(
                              fontSize: 14,color: white.withOpacity(0.4)
                            ),)
            
                          ],
                        ),
                        SizedBox(height: 4,),
                       Container(
                         width: (size.width-40)*1,
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text(chat_data[index]['text'],style: TextStyle(
                               fontSize: 15,
                               height: 1.3,
                               color: white.withOpacity(0.3)
                             ),),
                             chat_data[index]['badge'] > 0 ? Badge(
                               badgeColor: primary,
                               badgeContent: Padding(
                                 padding: const EdgeInsets.all(1),
                                 child: Text(chat_data[index]['badge'].toString(),style: TextStyle(
                                   color: white
                                 ),),
                               ),
                             ) : Container()
                           ],
                         ),
                       ),
                       Divider(
                         color: white.withOpacity(0.3),
                       )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
