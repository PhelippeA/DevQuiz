import 'package:flutter/material.dart';
import 'package:quiz_nlw5/home/controllers/home_state.dart';
import 'package:quiz_nlw5/home/repositories/home_repository.dart';
import 'package:quiz_nlw5/shared/models/quiz_model.dart';
import 'package:quiz_nlw5/shared/models/user_model.dart';

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  UserModel? user;
  List<QuizModel>? quizzes;

  final repository = HomeRepository();

  void getUser() async {
    state = HomeState.waiting;
    user = await repository.getUser();
    state = HomeState.sucess;
  }

  void getQuizzes() async {
    state = HomeState.waiting;
    quizzes = await repository.getQuizzes();
    state = HomeState.sucess;
  }
}
