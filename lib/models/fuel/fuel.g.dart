// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fuel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FuelAdapter extends TypeAdapter<_$FuelImpl> {
  @override
  final int typeId = 0;

  @override
  _$FuelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$FuelImpl(
      beforeL: fields[0] as int?,
      beforeC: fields[1] as int?,
      beforeR: fields[2] as int?,
      beforeTotal: fields[3] as int?,
      upliftL: fields[4] as int?,
      upliftC: fields[5] as int?,
      upliftR: fields[6] as int?,
      upliftTotal: fields[7] as int?,
      afterL: fields[8] as int?,
      afterC: fields[9] as int?,
      afterR: fields[10] as int?,
      afterTotal: fields[11] as int?,
      gaLon: fields[12] as int?,
      liter: fields[13] as double?,
      kg: fields[14] as double?,
      density: fields[15] as double?,
      discrepancy: fields[16] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, _$FuelImpl obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.beforeL)
      ..writeByte(1)
      ..write(obj.beforeC)
      ..writeByte(2)
      ..write(obj.beforeR)
      ..writeByte(3)
      ..write(obj.beforeTotal)
      ..writeByte(4)
      ..write(obj.upliftL)
      ..writeByte(5)
      ..write(obj.upliftC)
      ..writeByte(6)
      ..write(obj.upliftR)
      ..writeByte(7)
      ..write(obj.upliftTotal)
      ..writeByte(8)
      ..write(obj.afterL)
      ..writeByte(9)
      ..write(obj.afterC)
      ..writeByte(10)
      ..write(obj.afterR)
      ..writeByte(11)
      ..write(obj.afterTotal)
      ..writeByte(12)
      ..write(obj.gaLon)
      ..writeByte(13)
      ..write(obj.liter)
      ..writeByte(14)
      ..write(obj.kg)
      ..writeByte(15)
      ..write(obj.density)
      ..writeByte(16)
      ..write(obj.discrepancy);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FuelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FuelImpl _$$FuelImplFromJson(Map<String, dynamic> json) => _$FuelImpl(
      beforeL: json['beforeL'] as int?,
      beforeC: json['beforeC'] as int?,
      beforeR: json['beforeR'] as int?,
      beforeTotal: json['beforeTotal'] as int?,
      upliftL: json['upliftL'] as int?,
      upliftC: json['upliftC'] as int?,
      upliftR: json['upliftR'] as int?,
      upliftTotal: json['upliftTotal'] as int?,
      afterL: json['afterL'] as int?,
      afterC: json['afterC'] as int?,
      afterR: json['afterR'] as int?,
      afterTotal: json['afterTotal'] as int?,
      gaLon: json['gaLon'] as int?,
      liter: (json['liter'] as num?)?.toDouble(),
      kg: (json['kg'] as num?)?.toDouble(),
      density: (json['density'] as num?)?.toDouble(),
      discrepancy: (json['discrepancy'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$FuelImplToJson(_$FuelImpl instance) =>
    <String, dynamic>{
      'beforeL': instance.beforeL,
      'beforeC': instance.beforeC,
      'beforeR': instance.beforeR,
      'beforeTotal': instance.beforeTotal,
      'upliftL': instance.upliftL,
      'upliftC': instance.upliftC,
      'upliftR': instance.upliftR,
      'upliftTotal': instance.upliftTotal,
      'afterL': instance.afterL,
      'afterC': instance.afterC,
      'afterR': instance.afterR,
      'afterTotal': instance.afterTotal,
      'gaLon': instance.gaLon,
      'liter': instance.liter,
      'kg': instance.kg,
      'density': instance.density,
      'discrepancy': instance.discrepancy,
    };
