import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:quiz_vetor/components/centered_circular_progress.dart';
import 'package:quiz_vetor/components/centered_message.dart';
import 'package:quiz_vetor/components/finish_dialog.dart';
import 'package:quiz_vetor/components/result_dialog.dart';
import 'package:quiz_vetor/controllers/quiz_controller.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final _controller = QuizController();
  List<Widget> _scoreKeeper = [];

  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    await _controller.initialize();

    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        title: Text(
            'Quiz Vetor Sistemas ( ${_scoreKeeper.length}/${_controller.questionsNumber} )'),
        centerTitle: true,
        elevation: 0.0,
      ),
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: _buildQuiz(),
        ),
      )
    );
  }

  _buildQuiz() {
    if (_loading) return CenteredCircularProgress();

    if (_controller.questionsNumber == 0)
      return CenteredMessage(
        'Sem questões',
        icon: Icons.warning,
      );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _builFoto(_controller.getFoto()),
        _buildQuestion(_controller.getQuestion()),
        _buildAnswerButton(_controller.getAnswer1()),
        _buildAnswerButton(_controller.getAnswer2()),
        _buildAnswerButton(_controller.getAnswer3()),
        _buildAnswerButton(_controller.getAnswer4()),
        _buildAnswerButton(_controller.getAnswer5()),
        _buildScoreKeeper(),
      ],
    );
  }

  _buildQuestion(String question) {
    return Expanded(
      flex: 3,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Center(
          child: Text(
            question,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  _builFoto(String urlfoto) {
    return Column(
      children: <Widget>[
        Row(
          children: [
            Container(

              child: Center(child: Text(
                "Clique 2x para ampliar a imagem",
                style: TextStyle(color: Colors.white),
              ),),
            )
          ],
        ),
        Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2,
            child: PhotoView(
              //initialScale: PhotoViewComputedScale.contained * MediaQuery.of(context).size.width/ 2,
              imageProvider: NetworkImage(urlfoto),
            )),

      ],
    );
  }

  _buildAnswerButton(String answer) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 5.0),
        child: GestureDetector(
          child: Container(
            padding: EdgeInsets.all(4.0),
            color: Colors.blue,
            child: Center(
              child: AutoSizeText(
                answer,
                maxLines: 2,
                minFontSize: 10.0,
                maxFontSize: 32.0,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          onTap: () {
            bool correct = _controller.correctAnswer(answer);

            ResultDialog.show(
              context,
              question: _controller.question,
              correct: correct,
              onNext: () {
                setState(() {
                  _scoreKeeper.add(
                    Icon(
                      correct ? Icons.check : Icons.close,
                      color: correct ? Colors.green : Colors.red,
                    ),
                  );

                  if (_scoreKeeper.length < _controller.questionsNumber) {
                    _controller.nextQuestion();
                  } else {
                    FinishDialog.show(context,
                        hitNumber: _controller.hitNumber,
                        questionNumber: _controller.questionsNumber);
                  }
                });
              },
            );
          },
        ),

    );
  }

  _buildScoreKeeper() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _scoreKeeper,
      ),
    );
  }
}
