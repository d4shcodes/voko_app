class Question {
  final String questionText;
  final List<Answer> answerList;
  final String questImg;

  Question(this.questionText, this.questImg ,this.answerList);
}

class Answer {
  final String answerText;
  final bool isCorrect;
  Answer(this.answerText, this.isCorrect);
}

  //1
List<Question> getQuestion() {
  List<Question> list = [];

  list.add(Question(
    '',
    'assets/gif/epal.gif',
    [
      Answer('APLE', false),
      Answer('EPAL', true),
      Answer('IPAL', false),
      Answer('APPLE', false),
    ],
  ));

  //2 - keep
  list.add(Question(
    '',
    'assets/consonant/gif_10.gif',
    [
      Answer('SAYA SUKA MAKAN', true),
      Answer('SAYA SUKA BERENANG', false),
      Answer('SAYA SUKA MEMBACA', false),
      Answer('SAYA SUKA BERJALAN', false),
    ],
  ));

  //3
  list.add(Question(
    '',
    'assets/gif/unta.gif',
    [
      Answer('UNTE', false),
      Answer('UNTHA', false),
      Answer('UNTHE', false),
      Answer('UNTA', true),
    ],
  ));


  //4 - keep
  list.add(Question(
    '',
    'assets/consonant/gif_5.gif',
    [
      Answer('SAYA RASA TAKUT', false),
      Answer('SAYA RASA SEDIH', false),
      Answer('SAYA RASA GEMBIRA', true),
      Answer('SAYA RASA MARAH', false),
    ],
  ));

  //5
  list.add(Question(
    '',
    'assets/gif/ayam.gif',
    [
      Answer('AYEM', false),
      Answer('AYAM', true),
      Answer('AHYAM', false),
      Answer('HAYAM', false),
    ],
  ));

  //6 - keep
  list.add(Question(
    'Saya ________ di atas kerusi ?',
    'assets/consonant/gif_3.gif',
    [
      Answer('BERDIRI', false),
      Answer('BERENANG', false),
      Answer('TIDUR', false),
      Answer('DUDUK', true),
    ],
  ));


  //7 -OREN
  list.add(Question(
    '',
    'assets/gif/orange.gif',
    [
      Answer('ORIN', false),
      Answer('ORAN', false),
      Answer('OREN', true),
      Answer('ORIIN', false),
    ],
  ));
  
   //8- Fish
   list.add(Question(
    '',
    'assets/fish.gif',
    [
      Answer('EKAN', false),
      Answer('AKAN', false),
      Answer('EKEN', false),
      Answer('IKAN', true),
    ],
  ));



  return list;
}
