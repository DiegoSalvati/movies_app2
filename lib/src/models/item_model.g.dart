// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ItemModelAdapter extends TypeAdapter<ItemModel> {
  @override
  final int typeId = 0;

  @override
  ItemModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ItemModel(
      fields[3] as dynamic,
    )
      .._page = fields[0] as int?
      .._total_results = fields[1] as int?
      .._total_pages = fields[2] as int?;
  }

  @override
  void write(BinaryWriter writer, ItemModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj._page)
      ..writeByte(1)
      ..write(obj._total_results)
      ..writeByte(2)
      ..write(obj._total_pages)
      ..writeByte(3)
      ..write(obj._results);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ResultAdapter extends TypeAdapter<Result> {
  @override
  final int typeId = 1;

  @override
  Result read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Result(fields)
      .._vote_count = fields[4] as int?
      .._id = fields[5] as int?
      .._video = fields[6] as bool?
      .._vote_average = fields[7] as String?
      .._title = fields[8] as String?
      .._popularity = fields[9] as double?
      .._poster_path = fields[10] as String?
      .._original_language = fields[11] as String?
      .._original_title = fields[12] as String?
      .._genre_ids = (fields[13] as List).cast<int>()
      .._backdrop_path = fields[14] as String?
      .._adult = fields[15] as bool?
      .._overview = fields[16] as String?
      .._release_date = fields[17] as String?;
  }

  @override
  void write(BinaryWriter writer, Result obj) {
    writer
      ..writeByte(14)
      ..writeByte(4)
      ..write(obj._vote_count)
      ..writeByte(5)
      ..write(obj._id)
      ..writeByte(6)
      ..write(obj._video)
      ..writeByte(7)
      ..write(obj._vote_average)
      ..writeByte(8)
      ..write(obj._title)
      ..writeByte(9)
      ..write(obj._popularity)
      ..writeByte(10)
      ..write(obj._poster_path)
      ..writeByte(11)
      ..write(obj._original_language)
      ..writeByte(12)
      ..write(obj._original_title)
      ..writeByte(13)
      ..write(obj._genre_ids)
      ..writeByte(14)
      ..write(obj._backdrop_path)
      ..writeByte(15)
      ..write(obj._adult)
      ..writeByte(16)
      ..write(obj._overview)
      ..writeByte(17)
      ..write(obj._release_date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ResultAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
