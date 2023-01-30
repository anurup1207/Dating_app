import 'package:dating_app/blocs_swipe/swipe_bloc.dart';
import 'package:dating_app/config/theme.dart';
import 'package:dating_app/onboarding/onboarding_screen.dart';
import 'package:dating_app/screens/chat/chat_screen.dart';
import 'package:dating_app/screens/home/home_screen.dart';
import 'package:dating_app/screens/matches/match_screen.dart';
import 'package:dating_app/screens/profile/profile_screen.dart';
import 'package:dating_app/screens/users/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dating_app/model/models.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => SwipeBloc()
            ..add(
              LoadUserEvent(users: User.users),
            ),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: theme(),
        home: ProfileScreen(),
        routes: {
          UserScreen.routeName: (context) => UserScreen(),
          OnboardingScreen.routeName: (context) => OnboardingScreen(),
          MatchesScreen.routeName: (context) => MatchesScreen(),
          ChatScreen.routeName: (context) => ChatScreen(),
          ProfileScreen.routeName: (context) => ProfileScreen(),
        },
        // routes: {},
      ),
    );
  }
}
