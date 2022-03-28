import 'package:flutter/material.dart';
import 'package:true_citizen/model/question.dart';

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {

  int _currentQuestionIndex = 0;

  List questionBank = [
    Question.name(
        "The U.S Declaration of Independence was adopted in 1776", true),
    Question.name("The Supreme law of the land is the Constitution.", true),
    Question.name(
        "The two rights in the Declaration of Independence are:"
            "  \n Life  "
            "  \n Pursuit of happiness.",
        true),
    Question.name("The (U.S.) Constitution has 26 Amendments.", false),
    Question.name(
        "Freedom of religion means:\nYou can practice any religion, "
            "or not practice a religion.",
        true),
    Question.name("Journalist is one branch or part of the government.", false),
    Question.name("The Congress does not make federal laws.", false),
    Question.name("There are 100 U.S. Senators.", true),
    Question.name("We elect a U.S. Senator for 4 years.", false), //6
    Question.name("We elect a U.S. Representative for 2 years", true),
    Question.name(
        "A U.S. Senator represents all people of the United States", false),
    Question.name("We vote for President in January.", false),
    Question.name("Who vetoes bills is the President.", true),
    Question.name("The Constitution was written in 1787.", true),
    Question.name('George Bush is the \ " Father of Our Country " \.', false)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("True Citizen"),
        centerTitle: true,
        // backgroundColor: Colors.blueGrey,
      ),
      // backgroundColor: Colors.blueGrey,

      // we use [Builder] here to use a [context] that is a descendent of [Scaffold]
      // or else [Scaffold.of] will return null
      body: Builder(
        builder: (BuildContext context) =>
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Image.asset("images/us.jpg", width: 200,
                      height: 180,),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(14.4),
                        border: Border.all(
                          color: Colors.blueGrey.shade400,
                          style: BorderStyle.solid,
                        ),
                      ),
                      height: 120.0,
                      child: Center(child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(questionBank[_currentQuestionIndex]
                              .questionText,
                            // style: TextStyle(
                            //     fontSize: 16.0,
                            //     color: Colors.white
                            // ),
                          ),
                        ),
                      )),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      RaisedButton(onPressed: () => _prevQuestion(),
                        color: Colors.blueGrey.shade900,
                        child: Icon(Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                      RaisedButton(onPressed: () => _checkAnswer(true, context),
                        color: Colors.blueGrey.shade900,
                        child: Text("TRUE",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),

                      RaisedButton(
                        onPressed: () => _checkAnswer(false, context),
                        color: Colors.blueGrey.shade900,
                        child: Text("FALSE",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),

                      RaisedButton(onPressed: () => _nextQuestion(),
                        color: Colors.blueGrey.shade900,
                        child: Icon(Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                ],
              ),
            ),
      ),
    );
  }

  _prevQuestion(){
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex - 1) % questionBank.length;
      debugPrint("Index: $_currentQuestionIndex");
    });

  }

  _checkAnswer(bool userChoice, BuildContext context) {
    if (userChoice == questionBank[_currentQuestionIndex].isCorrect) {
      //correct answer
      final snackbar = SnackBar(
          backgroundColor: Colors.green,
          duration: Duration(milliseconds: 500),
          content: Text("Correct"));
      Scaffold.of(context).showSnackBar(snackbar);
      _updateQuestion();

      setState(() {
        _currentQuestionIndex++;
      });
    } else {
      debugPrint("Incorrect!");
      final snackbar = SnackBar(
          backgroundColor: Colors.red,
          duration: Duration(milliseconds: 500),
          content: Text("Incorrect "));
      Scaffold.of(context).showSnackBar(snackbar);
      _updateQuestion();
    }
  }

  _updateQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex + 1) % questionBank.length;
    });
  }

  _nextQuestion() {
    _updateQuestion();
  }
}

