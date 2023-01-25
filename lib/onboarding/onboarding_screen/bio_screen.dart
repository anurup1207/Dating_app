import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dating_app/onboarding/widgets/widgets.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class BioGraphy extends StatelessWidget {
  final TabController tabController;
  const BioGraphy({Key? key, required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextHeader(
                tabController: tabController,
                text: 'Describe Yourself a Bit',
              ),
              CustomTextField(
                tabController: tabController,
                text: "ENTER YOUR BIO",
              ),
              SizedBox(
                height: 100,
              ),
              CustomTextHeader(
                tabController: tabController,
                text: 'What do You Like?',
              ),
              SizedBox(
                height: 10,
              ),
              Wrap(
                children: [
                  CustomTextContainer(
                      tabController: tabController, text: 'MUSIC'),
                  CustomTextContainer(
                      tabController: tabController, text: 'ECONOMICS'),
                  CustomTextContainer(
                      tabController: tabController, text: 'ART'),
                  CustomTextContainer(
                      tabController: tabController, text: 'POLITICS'),
                  CustomTextContainer(
                      tabController: tabController, text: 'MUSIC'),
                  CustomTextContainer(
                      tabController: tabController, text: 'ECONOMICS'),
                  CustomTextContainer(
                      tabController: tabController, text: 'ART'),
                  CustomTextContainer(
                      tabController: tabController, text: 'POLITICS'),
                ],
              )
            ],
          ),
          Column(
            children: [
              StepProgressIndicator(
                totalSteps: 6,
                currentStep: 6,
                selectedColor: Theme.of(context).primaryColor,
                unselectedColor: Theme.of(context).backgroundColor,
              ),
              SizedBox(
                height: 10,
              ),
              CustomButton(
                tabController: tabController,
                text: 'NEXT STEP',
              ),
            ],
          ),
        ],
      ),

      // keyboardDismissBehavior: true,
    );
  }
}
