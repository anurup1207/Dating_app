import 'package:flutter/material.dart';

import '../../model/models.dart';
import '../../widgets/choice_button.dart';

class UserScreen extends StatelessWidget {
  static const routeName = '/user_screens';
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final p = ModalRoute.of(context)?.settings.arguments as User;
    final User users = p;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 40),
                    child: Hero(
                      tag: 'user_image',
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          image: DecorationImage(
                            image: NetworkImage(users.imageUrls[0]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60),
                      child: Row(
                        // crossAxisAlignment: CrossAxisAlignment.spa,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            // onTap: () {
                            // context.read<SwipeBloc>()
                            // ..add(SwipeLeftEvent(user: state.user[0]));
                            // },
                            child: ChoiceButton(
                              width: 60,
                              height: 60,
                              size: 25,
                              color: Theme.of(context).colorScheme.secondary,
                              hasgradient: false,
                              icon: Icons.clear_rounded,
                            ),
                          ),
                          InkWell(
                            // onTap: () {
                            // context.read<SwipeBloc>()
                            // ..add(SwipeRightEvent(user: state.user[0]));
                            // },
                            child: ChoiceButton(
                              width: 80,
                              height: 80,
                              size: 30,
                              color: Colors.white,
                              hasgradient: true,
                              icon: Icons.favorite,
                            ),
                          ),
                          ChoiceButton(
                            width: 60,
                            height: 60,
                            size: 25,
                            color: Theme.of(context).primaryColor,
                            hasgradient: false,
                            icon: Icons.watch_later,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${users.name}, ${users.age}',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Text(
                    '${users.jobTitle}',
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'About',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Text(
                    '${users.bio}',
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(height: 2),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Interests',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Wrap(
                    children: users.interests
                        .map(
                          (interests) => Container(
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.only(top: 5.0, right: 5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              gradient: LinearGradient(colors: [
                                Theme.of(context).primaryColor,
                                Theme.of(context).accentColor,
                              ]),
                            ),
                            child: Text(
                              '${interests}',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                    color: Colors.white,
                                  ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
