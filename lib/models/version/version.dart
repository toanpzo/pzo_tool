import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
part 'version.freezed.dart';
part 'version.g.dart';

@Freezed()
class Version with _$Version {
  @JsonSerializable(explicitToJson: true)

  @HiveType(typeId: 10, adapterName: 'VersionAdapter')
  const factory Version({
    @JsonKey(name: 'id')
    @HiveField(4)
     String? id,
    @JsonKey(name: 'model')
    @HiveField(1)
    required String model,
    @JsonKey(name: 'revision')
    @HiveField(2)
    required String revision,
    @JsonKey(name: 'revisionDate')
    @HiveField(3)
    required DateTime revisionDate,

  }) = _Version;

  factory Version.fromJson(Map<String, Object?> json)
  => _$VersionFromJson(json);

  factory Version.withDefaults({
    String? id,
    required String model,
    required String revision,
    required DateTime revisionDate,
  }) {
    final now = DateTime.now();
    final generatedId = id ?? now.millisecondsSinceEpoch.toString();

    return Version(
        id: generatedId,
      model: model,
      revision: revision,
        revisionDate: revisionDate

    );
  }
}