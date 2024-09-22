import 'package:tuwaiq_project/models/link_model.dart';
import 'package:tuwaiq_project/models/profile_model.dart';

class MembersProjectModel {
  MembersProjectModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.position,
    this.imageUrl,
    required this.link,
  });
  late final String id;
  late final String firstName;
  late final String lastName;
  late final String email;
  late final String position;
  late final String? imageUrl;
  late final LinkModel link;

  MembersProjectModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    position = json['position'];
    imageUrl = null;
    link = LinkModel.fromJson(json['link']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['position'] = position;
    data['image_url'] = imageUrl;
    data['link'] = link.toJson();
    return data;
  }
}
