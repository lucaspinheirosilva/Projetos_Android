class Question {
  String pergunta;
  String resposta1;
  String resposta2;
  String resposta3;
  String resposta4;
  String resposta5;
  String foto;

  Question({
    this.pergunta,
    this.resposta1,
    this.resposta2,
    this.resposta3,
    this.resposta4,
    this.resposta5,
    this.foto


  });

  Map<String, dynamic> toMap() {
    return {
      'question': pergunta,
      'answer1': resposta1,
      'answer2': resposta2,
      'answer3': resposta3,
      'answer4': resposta4,
      'answer5': resposta5,
      'foto': foto,
    };
  }

  static Question fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Question(
      pergunta: map['question'],
      resposta1: map['answer1'],
      resposta2: map['answer2'],
      resposta3: map['answer3'],
      resposta4: map['answer4'],
      resposta5: map['answer5'],
      foto: map['foto'],

    );
  }
}