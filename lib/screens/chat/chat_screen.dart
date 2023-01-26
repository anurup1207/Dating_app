import 'package:dating_app/model/models.dart';
import 'package:dating_app/widgets/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  static const routeName = '/chat_screen';
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userMatch = ModalRoute.of(context)?.settings.arguments as UserMatch;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).backgroundColor,
        iconTheme: IconThemeData(
          color: Theme.of(context).primaryColor,
        ),
        title: Center(
          child: Column(
            children: [
              CircleAvatar(
                radius: 15,
                backgroundImage:
                    NetworkImage(userMatch.matchedUser.imageUrls[0]),
              ),
              Text(
                userMatch.matchedUser.name,
                style: Theme.of(context).textTheme.headline4,
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: userMatch.chat != null
            ? Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: userMatch.chat![0].messages.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: userMatch.chat![0].messages[index].senderId == 1
                          ? Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).backgroundColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
                                ),
                                child: Text(
                                  userMatch.chat![0].messages[index].message,
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                              ),
                            )
                          : Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
                                ),
                                child: Text(
                                  userMatch.chat![0].messages[index].message,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(color: Colors.white),
                                ),
                              ),
                            ),
                    );
                  },
                ),
              )
            : SizedBox(),
      ),
    );
  }
}
