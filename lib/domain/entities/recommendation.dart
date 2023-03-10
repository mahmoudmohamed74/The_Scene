// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Recommendation extends Equatable {
  final int id;
  final String? backDropPath;
  final String title;
  final String overview;
  const Recommendation({
    required this.id,
    this.backDropPath,
    required this.title,
    required this.overview,
  });

  @override
  List<Object?> get props => [id, backDropPath, title, overview];
}
