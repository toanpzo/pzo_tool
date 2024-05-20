

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'save_score.freezed.dart';
part 'save_score.g.dart';


@freezed
class SaveScore with _$SaveScore {

  @HiveType(typeId: 8,adapterName: "SaveScoreAdapter")
  factory SaveScore({
    @HiveField(0)
    required int totalCorrect,
    @HiveField(1)
    required int totalWrong,
    @HiveField(2)
    required int dem,
    }) = _SaveScore;

  factory SaveScore.fromJson(Map<String, dynamic> json) => _$SaveScoreFromJson(json);

}