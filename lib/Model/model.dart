// To parse this JSON data, do
//
//     final photoModel = photoModelFromJson(jsonString);

import 'dart:convert';

List<PhotoModel> photoModelFromJson(String str) => List<PhotoModel>.from(json.decode(str).map((x) => PhotoModel.fromJson(x)));

String photoModelToJson(List<PhotoModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PhotoModel {
  String id;
  String slug;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime? promotedAt;
  int width;
  int height;
  String color;
  String blurHash;
  String? description;
  String altDescription;
  List<dynamic> breadcrumbs;
  Urls urls;
  PhotoModelLinks links;
  int likes;
  bool likedByUser;
  List<dynamic> currentUserCollections;
  Sponsorship? sponsorship;
  TopicSubmissions topicSubmissions;
  User user;

  PhotoModel({
    required this.id,
    required this.slug,
    required this.createdAt,
    required this.updatedAt,
    required this.promotedAt,
    required this.width,
    required this.height,
    required this.color,
    required this.blurHash,
    required this.description,
    required this.altDescription,
    required this.breadcrumbs,
    required this.urls,
    required this.links,
    required this.likes,
    required this.likedByUser,
    required this.currentUserCollections,
    required this.sponsorship,
    required this.topicSubmissions,
    required this.user,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json) => PhotoModel(
    id: json["id"],
    slug: json["slug"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    promotedAt: json["promoted_at"] == null ? null : DateTime.parse(json["promoted_at"]),
    width: json["width"],
    height: json["height"],
    color: json["color"],
    blurHash: json["blur_hash"],
    description: json["description"],
    altDescription: json["alt_description"],
    breadcrumbs: List<dynamic>.from(json["breadcrumbs"].map((x) => x)),
    urls: Urls.fromJson(json["urls"]),
    links: PhotoModelLinks.fromJson(json["links"]),
    likes: json["likes"],
    likedByUser: json["liked_by_user"],
    currentUserCollections: List<dynamic>.from(json["current_user_collections"].map((x) => x)),
    sponsorship: json["sponsorship"] == null ? null : Sponsorship.fromJson(json["sponsorship"]),
    topicSubmissions: TopicSubmissions.fromJson(json["topic_submissions"]),
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "slug": slug,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "promoted_at": promotedAt?.toIso8601String(),
    "width": width,
    "height": height,
    "color": color,
    "blur_hash": blurHash,
    "description": description,
    "alt_description": altDescription,
    "breadcrumbs": List<dynamic>.from(breadcrumbs.map((x) => x)),
    "urls": urls.toJson(),
    "links": links.toJson(),
    "likes": likes,
    "liked_by_user": likedByUser,
    "current_user_collections": List<dynamic>.from(currentUserCollections.map((x) => x)),
    "sponsorship": sponsorship?.toJson(),
    "topic_submissions": topicSubmissions.toJson(),
    "user": user.toJson(),
  };
}

class PhotoModelLinks {
  String self;
  String html;
  String download;
  String downloadLocation;

  PhotoModelLinks({
    required this.self,
    required this.html,
    required this.download,
    required this.downloadLocation,
  });

  factory PhotoModelLinks.fromJson(Map<String, dynamic> json) => PhotoModelLinks(
    self: json["self"],
    html: json["html"],
    download: json["download"],
    downloadLocation: json["download_location"],
  );

  Map<String, dynamic> toJson() => {
    "self": self,
    "html": html,
    "download": download,
    "download_location": downloadLocation,
  };
}

class Sponsorship {
  List<String> impressionUrls;
  String tagline;
  String taglineUrl;
  User sponsor;

  Sponsorship({
    required this.impressionUrls,
    required this.tagline,
    required this.taglineUrl,
    required this.sponsor,
  });

  factory Sponsorship.fromJson(Map<String, dynamic> json) => Sponsorship(
    impressionUrls: List<String>.from(json["impression_urls"].map((x) => x)),
    tagline: json["tagline"],
    taglineUrl: json["tagline_url"],
    sponsor: User.fromJson(json["sponsor"]),
  );

  Map<String, dynamic> toJson() => {
    "impression_urls": List<dynamic>.from(impressionUrls.map((x) => x)),
    "tagline": tagline,
    "tagline_url": taglineUrl,
    "sponsor": sponsor.toJson(),
  };
}

class User {
  String id;
  DateTime updatedAt;
  String username;
  String name;
  String firstName;
  String? lastName;
  String? twitterUsername;
  String? portfolioUrl;
  String? bio;
  String? location;
  UserLinks links;
  ProfileImage profileImage;
  String? instagramUsername;
  int totalCollections;
  int totalLikes;
  int totalPhotos;
  int totalPromotedPhotos;
  bool acceptedTos;
  bool forHire;
  Social social;

  User({
    required this.id,
    required this.updatedAt,
    required this.username,
    required this.name,
    required this.firstName,
    required this.lastName,
    required this.twitterUsername,
    required this.portfolioUrl,
    required this.bio,
    required this.location,
    required this.links,
    required this.profileImage,
    required this.instagramUsername,
    required this.totalCollections,
    required this.totalLikes,
    required this.totalPhotos,
    required this.totalPromotedPhotos,
    required this.acceptedTos,
    required this.forHire,
    required this.social,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    updatedAt: DateTime.parse(json["updated_at"]),
    username: json["username"],
    name: json["name"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    twitterUsername: json["twitter_username"],
    portfolioUrl: json["portfolio_url"],
    bio: json["bio"],
    location: json["location"],
    links: UserLinks.fromJson(json["links"]),
    profileImage: ProfileImage.fromJson(json["profile_image"]),
    instagramUsername: json["instagram_username"],
    totalCollections: json["total_collections"],
    totalLikes: json["total_likes"],
    totalPhotos: json["total_photos"],
    totalPromotedPhotos: json["total_promoted_photos"],
    acceptedTos: json["accepted_tos"],
    forHire: json["for_hire"],
    social: Social.fromJson(json["social"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "updated_at": updatedAt.toIso8601String(),
    "username": username,
    "name": name,
    "first_name": firstName,
    "last_name": lastName,
    "twitter_username": twitterUsername,
    "portfolio_url": portfolioUrl,
    "bio": bio,
    "location": location,
    "links": links.toJson(),
    "profile_image": profileImage.toJson(),
    "instagram_username": instagramUsername,
    "total_collections": totalCollections,
    "total_likes": totalLikes,
    "total_photos": totalPhotos,
    "total_promoted_photos": totalPromotedPhotos,
    "accepted_tos": acceptedTos,
    "for_hire": forHire,
    "social": social.toJson(),
  };
}

class UserLinks {
  String self;
  String html;
  String photos;
  String likes;
  String portfolio;
  String following;
  String followers;

  UserLinks({
    required this.self,
    required this.html,
    required this.photos,
    required this.likes,
    required this.portfolio,
    required this.following,
    required this.followers,
  });

  factory UserLinks.fromJson(Map<String, dynamic> json) => UserLinks(
    self: json["self"],
    html: json["html"],
    photos: json["photos"],
    likes: json["likes"],
    portfolio: json["portfolio"],
    following: json["following"],
    followers: json["followers"],
  );

  Map<String, dynamic> toJson() => {
    "self": self,
    "html": html,
    "photos": photos,
    "likes": likes,
    "portfolio": portfolio,
    "following": following,
    "followers": followers,
  };
}

class ProfileImage {
  String small;
  String medium;
  String large;

  ProfileImage({
    required this.small,
    required this.medium,
    required this.large,
  });

  factory ProfileImage.fromJson(Map<String, dynamic> json) => ProfileImage(
    small: json["small"],
    medium: json["medium"],
    large: json["large"],
  );

  Map<String, dynamic> toJson() => {
    "small": small,
    "medium": medium,
    "large": large,
  };
}

class Social {
  String? instagramUsername;
  String? portfolioUrl;
  String? twitterUsername;
  dynamic paypalEmail;

  Social({
    required this.instagramUsername,
    required this.portfolioUrl,
    required this.twitterUsername,
    required this.paypalEmail,
  });

  factory Social.fromJson(Map<String, dynamic> json) => Social(
    instagramUsername: json["instagram_username"],
    portfolioUrl: json["portfolio_url"],
    twitterUsername: json["twitter_username"],
    paypalEmail: json["paypal_email"],
  );

  Map<String, dynamic> toJson() => {
    "instagram_username": instagramUsername,
    "portfolio_url": portfolioUrl,
    "twitter_username": twitterUsername,
    "paypal_email": paypalEmail,
  };
}

class TopicSubmissions {
  BusinessWork? wallpapers;
  The3DRenders? experimental;
  The3DRenders? film;
  The3DRenders? spirituality;
  The3DRenders? people;
  The3DRenders? fashionBeauty;
  The3DRenders? texturesPatterns;
  The3DRenders? the3DRenders;
  BusinessWork? businessWork;
  The3DRenders? travel;
  The3DRenders? architectureInterior;
  The3DRenders? streetPhotography;
  The3DRenders? nature;

  TopicSubmissions({
    this.wallpapers,
    this.experimental,
    this.film,
    this.spirituality,
    this.people,
    this.fashionBeauty,
    this.texturesPatterns,
    this.the3DRenders,
    this.businessWork,
    this.travel,
    this.architectureInterior,
    this.streetPhotography,
    this.nature,
  });

  factory TopicSubmissions.fromJson(Map<String, dynamic> json) => TopicSubmissions(
    wallpapers: json["wallpapers"] == null ? null : BusinessWork.fromJson(json["wallpapers"]),
    experimental: json["experimental"] == null ? null : The3DRenders.fromJson(json["experimental"]),
    film: json["film"] == null ? null : The3DRenders.fromJson(json["film"]),
    spirituality: json["spirituality"] == null ? null : The3DRenders.fromJson(json["spirituality"]),
    people: json["people"] == null ? null : The3DRenders.fromJson(json["people"]),
    fashionBeauty: json["fashion-beauty"] == null ? null : The3DRenders.fromJson(json["fashion-beauty"]),
    texturesPatterns: json["textures-patterns"] == null ? null : The3DRenders.fromJson(json["textures-patterns"]),
    the3DRenders: json["3d-renders"] == null ? null : The3DRenders.fromJson(json["3d-renders"]),
    businessWork: json["business-work"] == null ? null : BusinessWork.fromJson(json["business-work"]),
    travel: json["travel"] == null ? null : The3DRenders.fromJson(json["travel"]),
    architectureInterior: json["architecture-interior"] == null ? null : The3DRenders.fromJson(json["architecture-interior"]),
    streetPhotography: json["street-photography"] == null ? null : The3DRenders.fromJson(json["street-photography"]),
    nature: json["nature"] == null ? null : The3DRenders.fromJson(json["nature"]),
  );

  Map<String, dynamic> toJson() => {
    "wallpapers": wallpapers?.toJson(),
    "experimental": experimental?.toJson(),
    "film": film?.toJson(),
    "spirituality": spirituality?.toJson(),
    "people": people?.toJson(),
    "fashion-beauty": fashionBeauty?.toJson(),
    "textures-patterns": texturesPatterns?.toJson(),
    "3d-renders": the3DRenders?.toJson(),
    "business-work": businessWork?.toJson(),
    "travel": travel?.toJson(),
    "architecture-interior": architectureInterior?.toJson(),
    "street-photography": streetPhotography?.toJson(),
    "nature": nature?.toJson(),
  };
}

class The3DRenders {
  Status status;

  The3DRenders({
    required this.status,
  });

  factory The3DRenders.fromJson(Map<String, dynamic> json) => The3DRenders(
    status: statusValues.map[json["status"]]!,
  );

  Map<String, dynamic> toJson() => {
    "status": statusValues.reverse[status],
  };
}

enum Status {
  REJECTED,
  UNEVALUATED
}

final statusValues = EnumValues({
  "rejected": Status.REJECTED,
  "unevaluated": Status.UNEVALUATED
});

class BusinessWork {
  String status;
  DateTime? approvedOn;

  BusinessWork({
    required this.status,
    this.approvedOn,
  });

  factory BusinessWork.fromJson(Map<String, dynamic> json) => BusinessWork(
    status: json["status"],
    approvedOn: json["approved_on"] == null ? null : DateTime.parse(json["approved_on"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "approved_on": approvedOn?.toIso8601String(),
  };
}

class Urls {
  String raw;
  String full;
  String regular;
  String small;
  String thumb;
  String smallS3;

  Urls({
    required this.raw,
    required this.full,
    required this.regular,
    required this.small,
    required this.thumb,
    required this.smallS3,
  });

  factory Urls.fromJson(Map<String, dynamic> json) => Urls(
    raw: json["raw"],
    full: json["full"],
    regular: json["regular"],
    small: json["small"],
    thumb: json["thumb"],
    smallS3: json["small_s3"],
  );

  Map<String, dynamic> toJson() => {
    "raw": raw,
    "full": full,
    "regular": regular,
    "small": small,
    "thumb": thumb,
    "small_s3": smallS3,
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
