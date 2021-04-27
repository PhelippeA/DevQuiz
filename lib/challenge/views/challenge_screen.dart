import 'package:flutter/material.dart';
import 'package:quiz_nlw5/challenge/controllers/challenge_controller.dart';
import 'package:quiz_nlw5/challenge/widgets/nextbutton_widget.dart';
import 'package:quiz_nlw5/challenge/widgets/question_indicator_widget.dart';
import 'package:quiz_nlw5/challenge/widgets/quiz_widget.dart';
import 'package:quiz_nlw5/core/core.dart';
import 'package:quiz_nlw5/result/result_screeen.dart';
import 'package:quiz_nlw5/shared/models/question_model.dart';

class ChallengeScreen extends StatefulWidget {
  final List<QuestionModel> questions;
  const ChallengeScreen({Key? key, required this.questions}) : super(key: key);

  @override
  _ChallengeScreenState createState() => _ChallengeScreenState();
}

class _ChallengeScreenState extends State<ChallengeScreen> {
  final _challengeController = ChallengeController();
  final _pageController = PageController();

  @override
  void initState() {
    _pageController.addListener(() =>
        _challengeController.currentPage = _pageController.page!.toInt() + 1);
    super.initState();
  }

  void nextPage() {
    if (_challengeController.currentPage < widget.questions.length)
      _pageController.nextPage(
        duration: Duration(seconds: 1),
        curve: Curves.linear,
      );
  }

  void onSelected(bool value) {
    if (value) 
      _challengeController.nCorrects++;
    nextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(106),
        child: SafeArea(
          top: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () => Navigator.of(context).pop(),
              ),
              ValueListenableBuilder<int>(
                valueListenable: _challengeController.currentPageNotifier,
                builder: (context, value, _) => QuestionIndicatorWidget(
                  currentPageNumber: value,
                  totalPages: widget.questions.length,
                ),
              ),
            ],
          ),
        ),
      ),
      body: PageView(
          controller: _pageController,
          children: widget.questions
              .map(
                (e) => QuizWidget(
                  question: e,
                  onSelected: onSelected,
                ),
              )
              .toList()),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ValueListenableBuilder(
            valueListenable: _challengeController.currentPageNotifier,
            builder: (context, value, _) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (value as int < widget.questions.length)
                  Expanded(
                    child: NextButtonWidget.white(
                      label: "Pular",
                      onTap: nextPage,
                    ),
                  ),
                SizedBox(width: 7),
                if (value == widget.questions.length)
                  Expanded(
                    child: NextButtonWidget.colored(
                      label: "Encerrar",
                      backGroundColor: AppColors.darkGreen,
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (ctx) => ResultScreen(
                              result: _challengeController.nCorrects,
                              title: widget.questions.first.title,
                              length: widget.questions.length,
                            ),
                          ),
                        );
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
