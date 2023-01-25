import 'package:dating_app/blocs_swipe/swipe_bloc.dart';
import 'package:dating_app/screens/users/user_screen.dart';
import 'package:flutter/material.dart';

import 'package:dating_app/widgets/custom_app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model/user_model.dart';
import 'package:dating_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  // const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'DISCOVER',
        hasAction: true,
      ),
      body: BlocBuilder<SwipeBloc, SwipeState>(
        builder: (context, state) {
          if (state is SwipeLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SwipeLoaded) {
            return Column(
              children: [
                InkWell(
                  onDoubleTap: () {
                    Navigator.of(context).pushNamed(UserScreen.routeName,
                        arguments: state.user[0]);
                  },
                  child: Draggable(
                    child: UserCard(user: state.user[0]),
                    feedback: UserCard(user: state.user[0]),
                    childWhenDragging: UserCard(
                      user: state.user[1],
                    ),
                    onDragEnd: (drag) {
                      if (drag.velocity.pixelsPerSecond.dx < 0) {
                        context.read<SwipeBloc>()
                          ..add(SwipeLeftEvent(user: state.user[0]));
                        print("Swipe left");
                      } else {
                        context.read<SwipeBloc>()
                          ..add(SwipeRightEvent(user: state.user[0]));
                        print("Swipe right");
                      }
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 60),
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.spa,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          context.read<SwipeBloc>()
                            ..add(SwipeLeftEvent(user: state.user[0]));
                        },
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
                        onTap: () {
                          context.read<SwipeBloc>()
                            ..add(SwipeRightEvent(user: state.user[0]));
                        },
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
                )
              ],
            );
          } else
            return Text("Something Went Wrong");
        },
      ),
    );
  }
}
