import 'package:flutter/material.dart';
import '../../core/app_gradients.dart';
import '../../core/app_text_styles.dart';
import 'score_card_widget.dart';

class AppBarWidget extends PreferredSize {
  AppBarWidget()
      : super(
            preferredSize: Size.fromHeight(250),
            child: Container(
              height: 250,
              child: Stack(
                children: [
                  Container(
                    height: 161,
                    width: double.maxFinite,
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: BoxDecoration(
                      gradient: AppGradients.linear,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text.rich(
                          TextSpan(
                            text: "Olá, ",
                            style: AppTextStyles.title,
                            children: [
                              TextSpan(
                                text: "Phelps",
                                style: AppTextStyles.titleBold,
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: 58,
                          height: 58,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(
                                "https://avatars.githubusercontent.com/u/70112912?s=400&u=512740b8eff2410bfb5b6a5197debe990ec0a3b9&v=4",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment(0.0, 1.0),
                    child: ScoreCardWidget(),
                  )
                ],
              ),
            ));
}
