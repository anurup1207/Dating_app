import 'package:dating_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import 'onboarding_screen/screens.dart';

class OnboardingScreen extends StatelessWidget {
  static const routeName = '/onboarding_screen';
  const OnboardingScreen({Key? key}) : super(key: key);
  static const List<Tab> tabs = <Tab>[
    Tab(text: 'Start'),
    Tab(text: 'Email'),
    Tab(text: 'EmailVerification'),
    Tab(text: 'DemoGraphics'),
    Tab(text: 'Pictures'),
    Tab(text: 'Biography'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Builder(
        builder: (BuildContext context) {
          final TabController tabController = DefaultTabController.of(context)!;
          tabController.addListener(() {
            if (!tabController.indexIsChanging) {}
          });

          return Scaffold(
            appBar: CustomAppBar(
              title: 'ARROW',
              hasAction: false,
            ),
            body: TabBarView(
              children: [
                Start(
                  tabController: tabController,
                ),
                Email(
                  tabController: tabController,
                ),
                EmailVerification(
                  tabController: tabController,
                ),
                Demo(
                  tabController: tabController,
                ),
                Pictures(
                  tabController: tabController,
                ),
                BioGraphy(
                  tabController: tabController,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
