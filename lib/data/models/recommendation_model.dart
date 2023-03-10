import 'package:the_scene/domain/entities/recommendation.dart';

class RecommendationModel extends Recommendation {
  const RecommendationModel({
    required super.id,
    super.backDropPath,
    required super.title,
    required super.overview,
  });
  factory RecommendationModel.fromJson(Map<String, dynamic> json) {
    return RecommendationModel(
      id: json["id"],
      backDropPath: json["backdrop_path"] ?? "/jr8tSoJGj33XLgFBy6lmZhpGQNu.jpg",
      title: json["title"],
      overview: json["overview"],
    );
  }
}
