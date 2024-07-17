class WordDefinition {
  String word;
  String phonetic;
  List<Phonetics> phonetics;
  String origin;
  List<Meanings> meanings;

  WordDefinition({
    required this.word,
    required this.phonetic,
    required this.phonetics,
    required this.origin,
    required this.meanings,
  });

  factory WordDefinition.fromJson(Map<String, dynamic> json) {
    return WordDefinition(
      word: json['word'] ?? '',
      phonetic: json['phonetic'] ?? '',
      phonetics: (json['phonetics'] as List)
          .map((item) => Phonetics.fromJson(item))
          .toList(),
      origin: json['origin'] ?? '',
      meanings: (json['meanings'] as List)
          .map((item) => Meanings.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'word': word,
      'phonetic': phonetic,
      'phonetics': phonetics.map((item) => item.toJson()).toList(),
      'origin': origin,
      'meanings': meanings.map((item) => item.toJson()).toList(),
    };
  }
}

class Phonetics {
  String text;
  String? audio;

  Phonetics({required this.text, this.audio});

  factory Phonetics.fromJson(Map<String, dynamic> json) {
    return Phonetics(
      text: json['text'] ?? '',
      audio: json['audio'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'audio': audio,
    };
  }
}

class Meanings {
  String partOfSpeech;
  List<Definitions> definitions;

  Meanings({required this.partOfSpeech, required this.definitions});

  factory Meanings.fromJson(Map<String, dynamic> json) {
    return Meanings(
      partOfSpeech: json['partOfSpeech'] ?? '',
      definitions: (json['definitions'] as List)
          .map((item) => Definitions.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'partOfSpeech': partOfSpeech,
      'definitions': definitions.map((item) => item.toJson()).toList(),
    };
  }
}

class Definitions {
  String definition;
  String? example;
  List<String> synonyms;
  List<String> antonyms;

  Definitions({
    required this.definition,
    this.example,
    required this.synonyms,
    required this.antonyms,
  });

  factory Definitions.fromJson(Map<String, dynamic> json) {
    return Definitions(
      definition: json['definition'] ?? '',
      example: json['example'],
      synonyms: (json['synonyms'] as List).map((item) => item.toString()).toList(),
      antonyms: (json['antonyms'] as List).map((item) => item.toString()).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'definition': definition,
      'example': example,
      'synonyms': synonyms,
      'antonyms': antonyms,
    };
  }
}
