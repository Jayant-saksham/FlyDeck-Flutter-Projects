import 'package:bmi/Widgets/buttom_button.dart';
import 'package:bmi/Widgets/icon_content.dart';
import 'package:bmi/Widgets/reuseable_card.dart';
import 'package:bmi/Widgets/round_icon_button.dart';
import 'package:bmi/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender {
  male,
  female,
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Gender selectedGender = Gender.female;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReuseableCard(
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: "MALE",
                    ),
                    color: selectedGender == Gender.male
                        ? activeCardColour
                        : inactiveCardColour,
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: "FEMALE",
                    ),
                    color: selectedGender == Gender.female
                        ? activeCardColour
                        : inactiveCardColour,
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ReuseableCard(
              cardChild: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "HEIGHT (cm)",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF8D8E98),
                      ),
                    ),
                    Text(
                      "${height.toString()}",
                      style: TextStyle(
                          fontSize: 50,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8D8E98),
                        thumbColor: Colors.pink,
                        overlayColor: bottomContainerColour,
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        onChanged: (double newHeight) {
                          setState(() {
                            height = newHeight.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              color: activeCardColour,
              onPress: () {},
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReuseableCard(
                    color: activeCardColour,
                    cardChild: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "WEIGHT (kg)",
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF8D8E98),
                            ),
                          ),
                          Text(
                            "${weight.toString()}",
                            style: TextStyle(
                                fontSize: 50,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundButton(
                                icon: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              RoundButton(
                                icon: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    onPress: () {},
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    color: activeCardColour,
                    cardChild: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "AGE",
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF8D8E98),
                            ),
                          ),
                          Text(
                            "${age.toString()}",
                            style: TextStyle(
                              fontSize: 50,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundButton(
                                icon: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              RoundButton(
                                icon: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    onPress: () {},
                  ),
                ),
              ],
            ),
          ),
          BottomButton(onPress: () {}, title: "CALCULATE")
        ],
      ),
    );
  }
}
