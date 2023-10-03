// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Examples extends StatefulWidget {
  const Examples({super.key});
  @override
  State<Examples> createState() => _ExamplesState();
}

class _ExamplesState extends State<Examples> {
  List<Widget> answer = [];
  int n = 0;
  int correctAnswer = 0, wrongAnswer = 0;
  void checkAnswer(bool check) {
    if (bol[n] == check) {
      correctAnswer++;
      setState(() {
        answer.add(const Padding(
          padding: EdgeInsets.all(2.0),
          child: Icon(
            Icons.thumb_up,
            color: Colors.green,
          ),
        ));
        n++;
      });
    } else {
      wrongAnswer++;
      setState(() {
        answer.add(
          const Padding(
            padding: EdgeInsets.all(2.0),
            child: Icon(
              Icons.thumb_down,
              color: Colors.red,
            ),
          ),
        );
        n++;
      });
    }
    if (n == bol.length) {
      Alert(
        context: context,
        //type: AlertType.success,
        title: "Der Test endet",
        desc: "Richtig: $correctAnswer\nFalsch: $wrongAnswer",
        buttons: [
          DialogButton(
            color: Colors.grey,
            //splashColor: Colors.red,
            highlightColor: Colors.green,
            onPressed: () => Navigator.pop(context),
            width: 120,
            child: const Text(
              "أعادة",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          )
        ],
      ).show();
      answer = [];
      correctAnswer = 0;
      wrongAnswer = 0;
    }
  }

  Map<String, String> qusetion = {
    'Null': '0.png',
    'Eins': '1.png',
    'Zwei': '2.png',
    'Dreiooo': '3.png',
    'Vier': '4.png',
    'Fünf': '5.png',
    'Sechsooo': '6.png',
    'Sieben': '7.png',
    'Acht': '8.png',
    'Neunooo': '9.png',
    'Zehnooo': '10.png',
  };
  List<bool> bol = [
    true,
    true,
    true,
    false,
    true,
    true,
    false,
    true,
    true,
    false,
    false,
  ];
  @override
  Widget build(BuildContext context) {
    n > 10 ? n = 0 : 0;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Row(
          children: answer,
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          flex: 4,
          child: Column(children: [
            Image.asset(
              'images/${qusetion.values.toList()[n]}',
              cacheWidth: 200,
            ),
            const SizedBox(
              height: 35,
            ),
            Text(
              qusetion.keys.toList()[n],
              style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                  fontSize: 30),
            ),
          ]),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.green),
              ),
              onPressed: () {
                checkAnswer(true);
              },
              child: const Text(
                'ja',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.red),
              ),
              onPressed: () {
                checkAnswer(false);
              },
              child: const Text(
                'nein',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
