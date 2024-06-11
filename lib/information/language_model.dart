class LanguageModel {
  final String id;
  final String name;
  final String image;

  LanguageModel({required this.id, required this.name, required this.image});

  factory LanguageModel.fromJson(Map<String, dynamic> json) {
    return LanguageModel(id: json['id'], name: json['name'], image: json['image']);
  }
}

List<LanguageModel> lang = [
  LanguageModel(id: '1', name: 'کوردی', image: 'assets/images/kurdish.png'),
  LanguageModel(id: '2', name: 'العربي', image: 'assets/images/arabi.png'),
  LanguageModel(id: '3', name: 'English', image: 'assets/images/english.png'),
];
