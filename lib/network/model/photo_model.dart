import 'package:json_annotation/json_annotation.dart';

part 'photo_model.g.dart';

@JsonSerializable()
class PhotoModel {
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;
  PhotoModel({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  factory PhotoModel.fromJson(Map<String, dynamic> json) =>
      _$PhotoModelFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoModelToJson(this);
}
