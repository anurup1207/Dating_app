import 'package:dating_app/widgets/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../model/models.dart';
import '../../widgets/widgets.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile_screen';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User user = User.users[0];
    return Scaffold(
      appBar: CustomAppBar(
        title: 'PROFILE',
        hasAction: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(3, 3),
                        blurRadius: 3,
                        spreadRadius: 3,
                      ),
                    ],
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        user.imageUrls[0],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                      colors: [
                        Theme.of(context).primaryColor.withOpacity(0.1),
                        Theme.of(context).primaryColor.withOpacity(0.9),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 40.0),
                      child: Text(
                        user.name,
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleWithIcon(
                    title: 'Biography',
                    icon: Icon(Icons.edit),
                  ),
                  Text(
                    user.bio,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(height: 1.5),
                  ),
                  TitleWithIcon(
                    title: 'Pictures',
                    icon: Icon(Icons.edit),
                  ),
                  SingleChildScrollView(
                    child: SizedBox(
                      height: 125,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (contex, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Container(
                              height: 125,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                border: Border.all(
                                    color: Theme.of(context).primaryColor),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    user.imageUrls[index],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  TitleWithIcon(
                    title: 'Locations',
                    icon: Icon(Icons.edit),
                  ),
                  Text(
                    'Singapore',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(height: 1.5),
                  ),
                  TitleWithIcon(
                    title: 'Interest',
                    icon: Icon(Icons.edit),
                  ),
                  Row(
                    children: [
                      CustomTextContainer(text: 'MUSIC'),
                      CustomTextContainer(text: 'DANCE'),
                      CustomTextContainer(text: 'SINGING'),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
