// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

const studentId = '630710325';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Question> _questions = [
    Question(
      choiceText: '1of3',
      questionText: 'What is the capital of Japan?',
      options: ['Tokyo', 'Bangkok', 'Seoul', 'Beijing'],
      correctOptionIndex: 0,
    ),
    Question(
      choiceText: '2of3',
      questionText: 'Which planet has oxygen and water?',
      options: ['Mars', 'Earth', 'Jupiter', 'Venus'],
      correctOptionIndex: 1,
    ),
    Question(
      choiceText: '4of3',
      questionText: 'Which animal is the king of the Jurassic?',
      options: ['Baryonyx', 'Dimorphodon', 'Tirex', 'Apatosaurous'],
      correctOptionIndex: 2,
    ),
    Question(
      choiceText: '4of4',
      questionText: 'Which Animal is smallest?',
      options: ['Lion', 'Dog', 'Cat', 'Ant'],
      correctOptionIndex: 3,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 20.0,
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/knowledge.jpg"),
              opacity: 0.6,
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Good Morning',
                textAlign: TextAlign.center,
                style: textTheme.headline4,
              ),
              Text(
                studentId,
                textAlign: TextAlign.center,
                style: textTheme.headline6!.copyWith(
                    fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              Spacer(),
              QuestionWidget(question: _questions[_currentIndex]),
              Spacer(),
              _buildButtonPanel(),
            ],
          ),
        ),
      ),
    );
  }

  _buildButtonPanel() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              if (_currentIndex > 0) {
                setState(() {
                  _currentIndex--;
                });
              }
            },
            child: Text('Previous'),
          ),
        ),
        SizedBox(width: 10.0),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              if (_currentIndex < _questions.length - 1) {
                setState(() {
                  _currentIndex++;
                });
              }
            },
            child: Text('Next'),
          ),
        ),
      ],
    );
  }
}

class Question {
  var choiceText;
  final String questionText;
  final List<String> options;
  final int correctOptionIndex;



  Question({
    required this.questionText,
    required this.options,
    required this.correctOptionIndex,
    required this.choiceText
  });
}

class QuestionWidget extends StatelessWidget {
  final Question question;

  QuestionWidget({required this.question});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      margin: EdgeInsets.symmetric(vertical: 28.0),
      decoration: BoxDecoration(

        color: Colors.blue.withOpacity(0.9),

        border: Border.all(color: Colors.black, width: 2.0),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        children: [
          Text(
            question.questionText,
            style: TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16.0),
          ...question.options.map((option) {
            int index = question.options.indexOf(option);
            return OptionWidget(
              text: option,
              isCorrect: index == question.correctOptionIndex,
            );
          }).toList(),
        ],
      ),
    );
  }
}

class OptionWidget extends StatelessWidget {
  final String text;
  final bool isCorrect;

  OptionWidget({required this.text, required this.isCorrect});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(text),
      leading: Icon(
        isCorrect ? Icons.check : Icons.close,
        color: isCorrect ? Colors.green : Colors.red,
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: HomePage()));
}
