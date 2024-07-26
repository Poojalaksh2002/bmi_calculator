import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/components/input_content.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/bottom_button.dart';
import '../components/constants.dart';

enum GenderType {
  MALE,
  FEMALE,
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderType? selectedGenderType;
  int heightValue = 187;
  int weightValue = 50;
  int ageValue = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('BMI CALCULATOR APP')),
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      onTapFunction: () {
                        setState(() {
                          selectedGenderType = GenderType.MALE;
                        });
                      },
                      colour: selectedGenderType == GenderType.MALE
                          ? kActiveCardColor
                          : kInActiveCardColor,
                      cardChild: IconContent(
                        IconData: FontAwesomeIcons.mars,
                        label: "MALE",
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      child: ReusableCard(
                        onTapFunction: () {
                          setState(() {
                            selectedGenderType = GenderType.FEMALE;
                          });
                        },
                        colour: selectedGenderType == GenderType.FEMALE
                            ? kActiveCardColor
                            : kInActiveCardColor,
                        cardChild: IconContent(
                          IconData: FontAwesomeIcons.venus,
                          label: "FEMALE",
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "HEIGHT",
                            style: kLabelTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                heightValue.toString(),
                                style: kNumberTextStyle,
                              ),
                              Text(
                                "cm",
                                style: kLabelTextStyle,
                              ),
                            ],
                          ),
                          SliderTheme(
                            data: SliderThemeData(
                                activeTrackColor: Colors.white,
                                thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 15),
                                overlayShape:
                                    RoundSliderOverlayShape(overlayRadius: 25),
                                thumbColor: Color(0xFFEB1555),
                                overlayColor:
                                    Color(0xFFEB1555).withOpacity(0.5)),
                            child: Slider(
                              value: heightValue.toDouble(),
                              min: 120.0,
                              max: 220.0,

                              inactiveColor: Color(0xFF8D8E98),
                              // label: heightValue.round().toString(),
                              onChanged: (double value) {
                                setState(() {
                                  heightValue = value.round();
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "WEIGHT",
                            style: kLabelTextStyle,
                          ),
                          Text(
                            weightValue.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                heroTag: "btn1",
                                shape: CircleBorder(),
                                backgroundColor: Color(0xFF4C4F5E),
                                child: RoundedIconButton(
                                    iconName: FontAwesomeIcons.plus),
                                onPressed: () {
                                  setState(() {
                                    weightValue++;
                                  });
                                },
                              ),
                              SizedBox(width: 15),
                              FloatingActionButton(
                                heroTag: "btn2",
                                shape: CircleBorder(),
                                backgroundColor: Color(0xFF4C4F5E),
                                child: RoundedIconButton(
                                    iconName: FontAwesomeIcons.minus),
                                onPressed: () {
                                  setState(() {
                                    weightValue--;
                                  });
                                },
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "AGE",
                            style: kLabelTextStyle,
                          ),
                          Text(
                            ageValue.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                heroTag: "btn3",
                                shape: CircleBorder(),
                                backgroundColor: Color(0xFF4C4F5E),
                                child: RoundedIconButton(
                                    iconName: FontAwesomeIcons.plus),
                                onPressed: () {
                                  setState(() {
                                    ageValue++;
                                  });
                                },
                              ),
                              SizedBox(width: 15),
                              FloatingActionButton(
                                heroTag: "btn4",
                                shape: CircleBorder(),
                                backgroundColor: Color(0xFF4C4F5E),
                                child: RoundedIconButton(
                                    iconName: FontAwesomeIcons.minus),
                                onPressed: () {
                                  setState(() {
                                    ageValue--;
                                  });
                                },
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            BottomButton(
              bottomTitle: "CALCULATE",
              onTapFunction: () {
                CalculatorBrain calcBrain =
                    CalculatorBrain(height: heightValue, weight: weightValue);
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => ResultPage(
                //               bmiValue: calcBrain.bmiCalculate(),
                //               bmiTextValue: calcBrain.getResultText(),
                //               bmiInterpretText:
                //                   calcBrain.getResultInterpretation(),
                //             )));

                Navigator.pushNamed(
                  context,
                  '/result_page',
                  arguments: {
                    'bmiValue': calcBrain.bmiCalculate(),
                    'bmiTextValue': calcBrain.getResultText(),
                    'bmiInterpretText': calcBrain.getResultInterpretation(),
                  },
                );
              },
            )
          ],
        ));
  }
}
