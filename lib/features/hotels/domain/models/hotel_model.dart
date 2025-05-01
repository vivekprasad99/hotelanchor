import 'package:equatable/equatable.dart';

class HotelModel extends Equatable {
  final String id;
  final String name;
  final String description;
  final String location;
  final String thumbnailUrl;
  final double rating;
  final double basePrice;
  final List<String> amenities;

  const HotelModel({
    required this.id,
    required this.name,
    required this.description,
    required this.location,
    required this.thumbnailUrl,
    required this.rating,
    required this.basePrice,
    required this.amenities,
  });

  factory HotelModel.fromJson(Map<String, dynamic> json) {
    return HotelModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      location: json['location'] as String,
      thumbnailUrl: json['thumbnail_url'] as String,
      rating: (json['rating'] as num).toDouble(),
      basePrice: (json['base_price'] as num).toDouble(),
      amenities: List<String>.from(json['amenities'] as List),
    );
  }

  @override
  List<Object?> get props => [id, name, description, location, thumbnailUrl, rating, basePrice, amenities];
}