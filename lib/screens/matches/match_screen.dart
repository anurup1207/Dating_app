import 'package:dating_app/widgets/custom_app_bar.dart';
import 'package:dating_app/widgets/user_image_small.dart';
import 'package:flutter/material.dart';
import 'package:dating_app/widgets/widgets.dart' as user;

import '../../model/models.dart';

class MatchesScreen extends StatelessWidget {
  static const routeName = '/match_screen';
  const MatchesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inactiveMatches = UserMatch.matches
        .where((match) => match.userId == 1 && match.chat!.isEmpty)
        .toList();
    final onactiveMatches = UserMatch.matches
        .where((match) => match.userId == 1 && match.chat!.isNotEmpty)
        .toList();
    // final String p;

    return Scaffold(
        appBar: CustomAppBar(
          title: "MATCHES",
          hasAction: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Your Likes",
                  style: Theme.of(context).textTheme.headline4,
                ),
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: inactiveMatches.length,
                    itemBuilder: (context, index) {
                      return Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          user.UserImageSmall(
                            height: 70,
                            width: 70,
                            ImageUrl:
                                inactiveMatches[index].matchedUser.imageUrls[0],
                          ),
                          Text(
                            inactiveMatches[index].matchedUser.name,
                            style: Theme.of(context).textTheme.headline6,
                          )
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Your Chats",
                  style: Theme.of(context).textTheme.headline4,
                ),
                SizedBox(
                  // height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: inactiveMatches.length,
                    itemBuilder: (context, index) {
                      return Row(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          user.UserImageSmall(
                            height: 70,
                            width: 70,
                            ImageUrl:
                                onactiveMatches[index].matchedUser.imageUrls[0],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                onactiveMatches[index].matchedUser.name,
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                onactiveMatches[index]
                                    .chat![0]
                                    .messages[0]
                                    .message,
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                onactiveMatches[index]
                                    .chat![0]
                                    .messages[0]
                                    .timeString,
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
