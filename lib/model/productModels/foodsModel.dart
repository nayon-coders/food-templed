// To parse this JSON data, do
//
//     final foodsModel = foodsModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

FoodsModel foodsModelFromJson(String str) => FoodsModel.fromJson(json.decode(str));

String foodsModelToJson(FoodsModel data) => json.encode(data.toJson());

class FoodsModel {
  final int id;
  final List<dynamic> openingHours;
  final List<CategorySet> categorySet;
  final List<dynamic> modifiergroupSet;
  final List<MenuitemSet> menuitemSet;
  final DateTime createdDate;
  final DateTime modifiedDate;
  final String uid;
  final String slug;
  final String title;
  final String description;
  final int restaurant;
  final int company;
  final List<int> locations;
  final List<dynamic> cuisineTypes;

  FoodsModel({
    required this.id,
    required this.openingHours,
    required this.categorySet,
    required this.modifiergroupSet,
    required this.menuitemSet,
    required this.createdDate,
    required this.modifiedDate,
    required this.uid,
    required this.slug,
    required this.title,
    required this.description,
    required this.restaurant,
    required this.company,
    required this.locations,
    required this.cuisineTypes,
  });

  factory FoodsModel.fromJson(Map<String, dynamic> json) => FoodsModel(
    id: json["id"],
    openingHours: List<dynamic>.from(json["opening_hours"].map((x) => x)),
    categorySet: List<CategorySet>.from(json["category_set"].map((x) => CategorySet.fromJson(x))),
    modifiergroupSet: List<dynamic>.from(json["modifiergroup_set"].map((x) => x)),
    menuitemSet: List<MenuitemSet>.from(json["menuitem_set"].map((x) => MenuitemSet.fromJson(x))),
    createdDate: DateTime.parse(json["created_date"]),
    modifiedDate: DateTime.parse(json["modified_date"]),
    uid: json["uid"],
    slug: json["slug"],
    title: json["title"],
    description: json["description"],
    restaurant: json["restaurant"],
    company: json["company"],
    locations: List<int>.from(json["locations"].map((x) => x)),
    cuisineTypes: List<dynamic>.from(json["cuisine_types"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "opening_hours": List<dynamic>.from(openingHours.map((x) => x)),
    "category_set": List<dynamic>.from(categorySet.map((x) => x.toJson())),
    "modifiergroup_set": List<dynamic>.from(modifiergroupSet.map((x) => x)),
    "menuitem_set": List<dynamic>.from(menuitemSet.map((x) => x.toJson())),
    "created_date": createdDate.toIso8601String(),
    "modified_date": modifiedDate.toIso8601String(),
    "uid": uid,
    "slug": slug,
    "title": title,
    "description": description,
    "restaurant": restaurant,
    "company": company,
    "locations": List<dynamic>.from(locations.map((x) => x)),
    "cuisine_types": List<dynamic>.from(cuisineTypes.map((x) => x)),
  };
}

class CategorySet {
  final int id;
  final int menuitemCnt;
  final List<int> menuitemSet;
  final DateTime createdDate;
  final DateTime modifiedDate;
  final String uid;
  final String slug;
  final String name;
  final String description;
  final int menu;
  final int restaurant;
  final List<dynamic> locations;

  CategorySet({
    required this.id,
    required this.menuitemCnt,
    required this.menuitemSet,
    required this.createdDate,
    required this.modifiedDate,
    required this.uid,
    required this.slug,
    required this.name,
    required this.description,
    required this.menu,
    required this.restaurant,
    required this.locations,
  });

  factory CategorySet.fromJson(Map<String, dynamic> json) => CategorySet(
    id: json["id"],
    menuitemCnt: json["menuitem_cnt"],
    menuitemSet: List<int>.from(json["menuitem_set"].map((x) => x)),
    createdDate: DateTime.parse(json["created_date"]),
    modifiedDate: DateTime.parse(json["modified_date"]),
    uid: json["uid"],
    slug: json["slug"],
    name: json["name"],
    description: json["description"],
    menu: json["menu"],
    restaurant: json["restaurant"],
    locations: List<dynamic>.from(json["locations"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "menuitem_cnt": menuitemCnt,
    "menuitem_set": List<dynamic>.from(menuitemSet.map((x) => x)),
    "created_date": createdDate.toIso8601String(),
    "modified_date": modifiedDate.toIso8601String(),
    "uid": uid,
    "slug": slug,
    "name": name,
    "description": description,
    "menu": menu,
    "restaurant": restaurant,
    "locations": List<dynamic>.from(locations.map((x) => x)),
  };
}

class MenuitemSet {
  final int id;
  final List<FoodsImage> images;
  final FoodsImage originalImage;
  final DateTime createdDate;
  final DateTime modifiedDate;
  final String uid;
  final String slug;
  final String name;
  final String description;
  final double basePrice;
  final double virtualPrice;
  final Currency currency;
  final int menu;
  final int restaurant;
  final List<int> extraNames;
  final List<int> extraDescriptions;
  final List<int> category;
  final List<dynamic> locations;

  MenuitemSet({
    required this.id,
    required this.images,
    required this.originalImage,
    required this.createdDate,
    required this.modifiedDate,
    required this.uid,
    required this.slug,
    required this.name,
    required this.description,
    required this.basePrice,
    required this.virtualPrice,
    required this.currency,
    required this.menu,
    required this.restaurant,
    required this.extraNames,
    required this.extraDescriptions,
    required this.category,
    required this.locations,
  });

  factory MenuitemSet.fromJson(Map<String, dynamic> json) => MenuitemSet(
    id: json["id"],
    images: List<FoodsImage>.from(json["images"].map((x) => FoodsImage.fromJson(x))),
    originalImage: FoodsImage.fromJson(json["original_image"]),
    createdDate: DateTime.parse(json["created_date"]),
    modifiedDate: DateTime.parse(json["modified_date"]),
    uid: json["uid"],
    slug: json["slug"],
    name: json["name"],
    description: json["description"],
    basePrice: json["base_price"]?.toDouble(),
    virtualPrice: json["virtual_price"]?.toDouble(),
    currency: currencyValues.map[json["currency"]]!,
    menu: json["menu"],
    restaurant: json["restaurant"],
    extraNames: List<int>.from(json["extra_names"].map((x) => x)),
    extraDescriptions: List<int>.from(json["extra_descriptions"].map((x) => x)),
    category: List<int>.from(json["category"].map((x) => x)),
    locations: List<dynamic>.from(json["locations"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
    "original_image": originalImage.toJson(),
    "created_date": createdDate.toIso8601String(),
    "modified_date": modifiedDate.toIso8601String(),
    "uid": uid,
    "slug": slug,
    "name": name,
    "description": description,
    "base_price": basePrice,
    "virtual_price": virtualPrice,
    "currency": currencyValues.reverse[currency],
    "menu": menu,
    "restaurant": restaurant,
    "extra_names": List<dynamic>.from(extraNames.map((x) => x)),
    "extra_descriptions": List<dynamic>.from(extraDescriptions.map((x) => x)),
    "category": List<dynamic>.from(category.map((x) => x)),
    "locations": List<dynamic>.from(locations.map((x) => x)),
  };
}

enum Currency {
  USD
}

final currencyValues = EnumValues({
  "USD": Currency.USD
});

class FoodsImage {
  final int id;
  final String workingUrl;
  final DateTime createdDate;
  final DateTime modifiedDate;
  final String remoteUrl;
  final String localUrl;

  FoodsImage({
    required this.id,
    required this.workingUrl,
    required this.createdDate,
    required this.modifiedDate,
    required this.remoteUrl,
    required this.localUrl,
  });

  factory FoodsImage.fromJson(Map<String, dynamic> json) => FoodsImage(
    id: json["id"],
    workingUrl: json["working_url"],
    createdDate: DateTime.parse(json["created_date"]),
    modifiedDate: DateTime.parse(json["modified_date"]),
    remoteUrl: json["remote_url"],
    localUrl: json["local_url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "working_url": workingUrl,
    "created_date": createdDate.toIso8601String(),
    "modified_date": modifiedDate.toIso8601String(),
    "remote_url": remoteUrl,
    "local_url": localUrl,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
