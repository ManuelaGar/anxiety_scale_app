import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'components/reusable_card.dart';
import 'components/rounded_button.dart';

List<IconData> anxietyFaces = [
  FontAwesomeIcons.laughBeam,
  FontAwesomeIcons.smileBeam,
  FontAwesomeIcons.meh,
  FontAwesomeIcons.frown,
  FontAwesomeIcons.sadTear,
  FontAwesomeIcons.tired,
];

List<String> anxietyTypesEn = [
  'No anxiety',
  'Mild anxiety',
  'Moderate anxiety',
  'Severe anxiety',
  'Very severe anxiety',
  'Worst anxiety possible'
];

/*List<String> anxietyTypesEs = [
  'Sin ansiedad',
  'Ansiedad moderada',
  'Ansiedad insoportable'
];*/

Color kSelectMeditationTextColor = Color(0xFF1D1E33);
Color kActiveCardColor = Colors.white;
const kBrandMildBlue = Color(0xFF008CCE);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AnxietyScaleScreen(),
    );
  }
}

class AnxietyScaleScreen extends StatefulWidget {
  static const id = 'anxiety_scale_screen';

  /*AnxietyScaleScreen({
    @required this.selectedRecording,
    @required this.selectedPhase,
    @required this.selectedRecordingFormatted,
    @required this.kUrl,
    @required this.backgroundImage,
    @required this.originScreenId,
    this.painBefore,
  });

  final String selectedRecording;
  final String selectedPhase;
  final String selectedRecordingFormatted;
  final String kUrl;
  final String backgroundImage;
  final String originScreenId;
  final int painBefore;*/

  @override
  _AnxietyScaleScreenState createState() => _AnxietyScaleScreenState();
}

class _AnxietyScaleScreenState extends State<AnxietyScaleScreen> {
  /*String currentRecording;
  String currentPhase;
  String currentRecordingFormatted;
  String songUrl;
  String bgImage;
  String screenId;
  int painBeforeValue;*/

  int anxiety = 0;
  double anxietyIconSize = 35.0;

  String anxietyText = '';
  Color anxietyColor = Colors.green;
  IconData emotionIcon = FontAwesomeIcons.laughBeam;

  @override
  void initState() {
    /*currentRecording = widget.selectedRecording;
    currentPhase = widget.selectedPhase;
    currentRecordingFormatted = widget.selectedRecordingFormatted;
    songUrl = widget.kUrl;
    bgImage = widget.backgroundImage;
    screenId = widget.originScreenId;
    painBeforeValue = widget.painBefore;

    print(screenId);*/

    super.initState();
  }

  void changeTextAndColor(anxietyTypes) {
    String anxietyTxt = anxietyTypes[0];
    Color anxietyCol = Colors.green;
    IconData icon = anxietyFaces[0];
    if (anxiety == 0) {
      anxietyTxt = anxietyTypes[0];
      icon = anxietyFaces[0];
      anxietyCol = Colors.green;
    } else if (anxiety <= 2) {
      anxietyTxt = anxietyTypes[1];
      icon = anxietyFaces[1];
      anxietyCol = Colors.blue;
    } else if (anxiety <= 4) {
      anxietyTxt = anxietyTypes[2];
      icon = anxietyFaces[2];
      anxietyCol = Colors.deepPurpleAccent;
    } else if (anxiety <= 6) {
      anxietyTxt = anxietyTypes[3];
      icon = anxietyFaces[3];
      anxietyCol = Colors.purple;
    } else if (anxiety <= 8) {
      anxietyTxt = anxietyTypes[4];
      icon = anxietyFaces[4];
      anxietyCol = Colors.deepOrange;
    } else if (anxiety <= 10) {
      anxietyTxt = anxietyTypes[5];
      icon = anxietyFaces[5];
      anxietyCol = Colors.red;
    }
    setState(() {
      anxietyText = anxietyTxt;
      anxietyColor = anxietyCol;
      emotionIcon = icon;
    });
  }

  @override
  Widget build(BuildContext context) {
    /*final l10n = AppLocalizations.of(context);
    Locale myLocale =
    newLocale != null ? newLocale : Localizations.localeOf(context);
    */
    List<String> anxietyTypes = anxietyTypesEn;

    bool isLargeScreen =
        MediaQuery.of(context).copyWith().size.width > 600 ? true : false;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: kSelectMeditationTextColor,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'ANXIETY Scale' /*l10n.painTitle*/,
          style: TextStyle(
            color: kSelectMeditationTextColor,
          ),
        ),
      ),
      body: Container(
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: Text(
                    'What is your current anxiety level?' /*l10n.painText*/,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25.0,
                      color: kSelectMeditationTextColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  margin: isLargeScreen
                      ? EdgeInsets.symmetric(
                          horizontal:
                              MediaQuery.of(context).copyWith().size.width *
                                  0.15)
                      : EdgeInsets.all(0.0),
                  child: ReusableCard(
                    height:
                        MediaQuery.of(context).copyWith().size.height * 0.37,
                    colour: kActiveCardColor,
                    cardChild: Container(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            anxietyText,
                            style: TextStyle(
                              fontSize: 20.0,
                              color: anxietyColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            anxiety.toString(),
                            style: TextStyle(
                              fontSize: 50.0,
                              fontWeight: FontWeight.w900,
                              color: anxietyColor,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(15.0),
                            child: Icon(
                              emotionIcon,
                              color: anxietyColor,
                              size: 70.0,
                            ),
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              activeTrackColor: anxietyColor,
                              inactiveTrackColor: Color(0xFF8D8E98),
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 10.0),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 20.0),
                              thumbColor: anxietyColor,
                              overlayColor: anxietyColor.withOpacity(0.29),
                            ),
                            child: Slider(
                              value: anxiety.toDouble(),
                              min: 0.0,
                              max: 10.0,
                              onChanged: (double newValue) {
                                setState(() {
                                  anxiety = newValue.round();
                                  changeTextAndColor(anxietyTypes);
                                });
                              },
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.green,
                                size: 10.0,
                              ),
                              Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.red,
                                size: 10.0,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Icon(
                                FontAwesomeIcons.laughBeam,
                                color: Colors.green,
                                size: anxietyIconSize,
                              ),
                              Icon(
                                FontAwesomeIcons.smileBeam,
                                color: Colors.blue,
                                size: anxietyIconSize,
                              ),
                              Icon(
                                FontAwesomeIcons.meh,
                                color: Colors.deepPurpleAccent,
                                size: anxietyIconSize,
                              ),
                              Icon(
                                FontAwesomeIcons.frown,
                                color: Colors.purple,
                                size: anxietyIconSize,
                              ),
                              Icon(
                                FontAwesomeIcons.sadTear,
                                color: Colors.deepOrange,
                                size: anxietyIconSize,
                              ),
                              Icon(
                                FontAwesomeIcons.tired,
                                color: Colors.red,
                                size: anxietyIconSize,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: isLargeScreen
                      ? EdgeInsets.symmetric(
                          horizontal:
                              MediaQuery.of(context).copyWith().size.width *
                                  0.17)
                      : EdgeInsets.symmetric(horizontal: 20.0),
                  child: RoundedButton(
                    color: kBrandMildBlue,
                    title:
                        'Done' /*screenId == SelectMeditationScreen.id ||
                            screenId == BreatheScreen.id
                        ? l10n.painStartBtn
                        : l10n.painFinishBtn*/
                    ,
                    onPress: () {
                      print('pressed');
                      /*if (screenId == SelectMeditationScreen.id) {
                        painBeforeValue = anxiety;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PlayMusicScreen(
                              selectedRecording: currentRecording,
                              selectedPhase: currentPhase,
                              selectedRecordingFormatted:
                                  currentRecordingFormatted,
                              kUrl: songUrl,
                              backgroundImage: bgImage,
                              originScreen: AnxietyScaleScreen.id,
                              painBefore: painBeforeValue,
                            ),
                          ),
                        );
                      } else if (screenId == BreatheScreen.id) {
                        painBeforeValue = anxiety;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Breathing478Screen(
                              selectedRecording: currentRecording,
                              selectedPhase: currentPhase,
                              selectedRecordingFormatted:
                                  currentRecordingFormatted,
                              kUrl: songUrl,
                              originScreen: AnxietyScaleScreen.id,
                              painBefore: painBeforeValue,
                            ),
                          ),
                        );
                      } else if (screenId == PlayMusicScreen.id ||
                          screenId == Breathing478Screen.id) {
                        if (painBeforeValue != null) {
                          print(painBeforeValue);
                          print(anxiety);
                          FirebaseFunctions().updateUserPainScales(
                              context,
                              l10n,
                              currentPhase,
                              currentRecording,
                              painBeforeValue,
                              anxiety);
                        }
                        int count = 0;
                        Navigator.popUntil(context, (route) {
                          return count++ == 3;
                        });
                      }*/
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
