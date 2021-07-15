import 'package:flutter/material.dart';
import 'package:quiz/ui/quizes.dart';

int _currentIndex = 0;
List quiz = [
  textlist.name("The National fruit of India is Mango?", true),
  textlist.name("The National Sport of India is Hockey?", true),
  textlist.name("First ODI Cricket in India was played in Ahemadabad?", true),
  textlist.name('Goa is famous for not producing coconut.?', true),
  textlist.name("Polo was originated in Assam?", false),
  textlist.name("The Khalsa was born in 1699.?", true)
];

class quizez extends StatefulWidget {
  @override
  _quizezState createState() => _quizezState();
}

class _quizezState extends State<quizez> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Title(color: Colors.white, child: Text("true indian")),
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: Colors.blueGrey,
      body: Builder(
        builder: (BuildContext) => Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  "assets/images/first.jpg",
                  width: 240,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  width: 250,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: Colors.grey,
                      style: BorderStyle.solid,
                    ),
                  ),
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Text(quiz[_currentIndex].question,
                        style: TextStyle(color: Colors.white)),
                  )),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => _ans(true, BuildContext),
                    child: Text("true"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueGrey.shade400,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => _ans(false, BuildContext),
                    child: Text(
                      "false",
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blueGrey.shade400),
                  ),
                  ElevatedButton(
                    onPressed: () => _nextq(),
                    child: Icon(Icons.arrow_forward),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blueAccent.shade400),
                  )
                ],
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  _ans(bool userchoce, BuildContext context) {
    setState(() {
      if (userchoce == quiz[_currentIndex].isCorrect) {
        final snackbar = SnackBar(content: Text("correct"));
        ScaffoldMessenger.of(context).showSnackBar(snackbar);

        debugPrint("correct");
      } else {
        debugPrint("incorrect");
        final snackBar = SnackBar(content: Text("incorrect"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });
  }

  _nextq() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % quiz.length;
    });
  }
}
