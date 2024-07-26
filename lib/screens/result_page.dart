import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';
import '../components/constants.dart';

class ResultPage extends StatefulWidget {
  // ResultPage({
  //   Key? key,
  //   required this.bmiValue,
  //   required this.bmiTextValue,
  //   required this.bmiInterpretText,
  // }) : super(key: key);

  // final String bmiValue;
  // final String bmiTextValue;
  // final String bmiInterpretText;
  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  late String bmiValue;
  late String bmiTextValue;
  late String bmiInterpretText;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    bmiValue = args['bmiValue'];
    bmiTextValue = args['bmiTextValue'];
    bmiInterpretText = args['bmiInterpretText'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text('BMI CALCULATOR APP'),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.only(left: 15, top: 10),
            child: Text(
              "Your Result",
              style: kTitleTextStyle,
            ),
          ),
          Expanded(
            flex: 3,
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    bmiTextValue,
                    style: kResultTextStyle,
                  ),
                  Text(
                    bmiValue,
                    style: kBmiTextStyle,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    bmiInterpretText,
                    style: kResultTextStyle,
                  )
                ],
              ),
            ),
          ),
          BottomButton(
            bottomTitle: "RECALCULATE",
            onTapFunction: () => Navigator.pop(context),
          )
        ],
      ),
    );
  }
}
