class DataModel {
  late int id;
  late dynamic price;
  late String title;
  late String description;
  late String category;
  late String image;
  late Rating rating;

  DataModel({
    required this.id,
    required this.price,
    required this.title,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory DataModel.fromJson(Map json) {
    return DataModel(
      id: json['id'],
      price: json['price'],
      title: json['title'],
      description: json['description'] as String,
      category: json['category'] as String,
      image: json['image'] as String,
      rating: Rating.fromJson(json['rating']),
    );
  }
}

class Rating {
  late double rate;
  late int count;

  Rating({
    required this.rate,
    required this.count,
  });

  factory Rating.fromJson(Map json) {
    return Rating(
      rate: (json['rate'] as num).toDouble(),
      count: json['count'] as int,
    );
  }
}
