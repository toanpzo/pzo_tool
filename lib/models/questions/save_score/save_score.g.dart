// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_score.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SaveScoreAdapter extends TypeAdapter<_$SaveScoreImpl> {
  @override
  final int typeId = 8;

  @override
  _$SaveScoreImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$SaveScoreImpl(
      totalCorrect: fields[0] as int,
      totalWrong: fields[1] as int,
      dem: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, _$SaveScoreImpl obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.totalCorrect)
      ..writeByte(1)
      ..write(obj.totalWrong)
      ..writeByte(2)
      ..write(obj.dem);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SaveScoreAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SaveScoreImpl _$$SaveScoreImplFromJson(Map<String, dynamic> json) =>
    _$SaveScoreImpl(
      totalCorrect: json['totalCorrect'] as int,
      totalWrong: json['totalWrong'] as int,
      dem: json['dem'] as int,
    );

Map<String, dynamic> _$$SaveScoreImplToJson(_$SaveScoreImpl instance) =>
    <String, dynamic>{
      'totalCorrect': instance.totalCorrect,
      'totalWrong': instance.totalWrong,
      'dem': instance.dem,
    };
