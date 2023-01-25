import 'package:dating_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../../model/models.dart';

class MatchesScreen extends StatelessWidget {
  static const routeName = '/match_screen';
  const MatchesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inactiveMatches= UserMatch.matches.where((match)=> match.id==1 && match.chat!.isEmpty);
    final onactiveMatches= UserMatch.matches.where((match)=> match.id==1 && match.chat!.isNotEmpty);


    return Scaffold(
        appBar: CustomAppBar(
          title: "MATCHES",
          hasAction: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Your Likes",
                style: Theme.of(context).textTheme.headline4,
              ),
              SizedBox(
                height: 100,
                child: ListView.builder(itemBuilder: itemBuilder, itemCount: ,),
              )
            ],
          ),
        ));
  }
}
