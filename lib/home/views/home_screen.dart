import 'package:flutter/material.dart';
import 'package:quiz_nlw5/home/controllers/home_controller.dart';
import 'package:quiz_nlw5/home/controllers/home_state.dart';
import 'package:quiz_nlw5/home/widgets/level_button_widget.dart';
import 'package:quiz_nlw5/home/widgets/quiz_card_widget.dart';
import '../../home/widgets/appbar_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = HomeController();

  @override
  void initState() {
    super.initState();
    _controller.getQuizzes();
    _controller.getUser();
    _controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return _controller.state == HomeState.waiting
        ? Scaffold(
            body: CircularProgressIndicator(),
          )
        : Scaffold(
            appBar: AppBarWidget(user: _controller.user!),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(height: 24),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        LevelButtonWidget(label: "Fácil"),
                        LevelButtonWidget(label: "Médio"),
                        LevelButtonWidget(label: "Difícil"),
                        LevelButtonWidget(label: "Perito"),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      children: _controller.quizzes!
                          .map((e) => QuizCardWidget(
                                title: e.title,
                                totalAnswered: e.totalQuestionAnswered,
                                totalQuestions: e.questions.length,
                              ))
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
