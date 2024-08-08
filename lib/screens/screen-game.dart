// ignore_for_file: file_names, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voko_app/model/question_list.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  List<Question> questionList = getQuestion();
  int curr_questIndex = 0;
  int score = 0;
  Answer? selectedAnswer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: const Color(0XFFF9F9F9),
        backgroundColor: Color(0XFF13427C),
        // title: Text('PERMAINAN'),
        // centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              questionWidget(),
              SizedBox(height: 50.h),
              answerList(),
              SizedBox(
                height: 100.h,
              ),
              nextButton(),
            ],
          ),
        ),
      ),
    );
  }

  questionWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 50.h),
        Text("Soalan ${curr_questIndex + 1} / ${questionList.length.toString()}"),
        SizedBox(height: 50.h),
        ClipRRect(
          borderRadius: BorderRadius.circular(30.0.sp),
          child: Image.asset(
            questionList[curr_questIndex].questImg,
            height: 400.0.h,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill, // You can adjust the BoxFit as needed
          ),
        ),
        SizedBox(height: 50.h),
        Text(questionList[curr_questIndex].questionText),
      ],
    );
  }

  answerList() {
    return Column(
        children: questionList[curr_questIndex]
            .answerList
            .map((e) => answerButton(e))
            .toList());
  }

  Widget answerButton(Answer answer) {
    bool isSelected = answer == selectedAnswer;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      width: double.infinity,
      height: 130.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: isSelected ? Colors.white : Colors.black, backgroundColor: isSelected ? Color(0XFF13427C) : Colors.white, shape:  StadiumBorder()
        ),
        onPressed: () {
          setState(() {
            if (selectedAnswer == null) {
              if (answer.isCorrect) {
                score++;
              }
            }
            selectedAnswer = answer;
            print(answer.answerText);
          });
        },
        child: Text(answer.answerText),
      ),
    );
  }

  Widget nextButton() {
    bool isLastQuestion = false;

    if (curr_questIndex == questionList.length - 1) {
      isLastQuestion = true;
    }

    return Container(
      width: double.infinity,
      height: 130.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0XFF13427C),
          foregroundColor: Colors.white,
        ),
        child: Text(isLastQuestion ? "SERAH" : 'SETERUSNYA'),
        onPressed: () {
          if (isLastQuestion) {
            showDialog(context: context, builder: (_) => showScoreDialog());
          } else {
            setState(() {
              selectedAnswer = null;
              curr_questIndex++;
            });
          }
        },
      ),
    );
  }

  Widget showScoreDialog() {
    bool isPassed = false;

    if (score >= questionList.length * 0.6) {
      isPassed = true;
    }

    String title = isPassed ? 'LULUS' : 'GAGAL';

    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text(title + " | SKOR : ${score.toString()}",
      style: TextStyle(
          color: isPassed ? Colors.green : Colors.red,
          fontSize: 50.sp,
        ),
      ),
      content: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0XFF13427C),
          foregroundColor: Color(0XFFF9F9F9),
        ),
        child: Text('CUBA LAGI',
          style: TextStyle(
            fontSize: 42.sp,
          ),

        ),
        onPressed: () {
          Navigator.pop(context);
          setState(() {
            curr_questIndex = 0;
            score = 0;
            selectedAnswer = null;
          });
        },
      ),
    );
  }
}
