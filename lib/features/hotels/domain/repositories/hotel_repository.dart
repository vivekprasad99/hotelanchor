import '../models/hotel_model.dart';

abstract class HotelRepository {
  Future<List<HotelModel>> getHotels({
    double? minPrice,
    double? maxPrice,
    double? minRating,
    List<String>? amenities,
  });

  Future<HotelModel> getHotelById(String id);
}
