import 'package:supabase_flutter/supabase_flutter.dart';
import '../../domain/models/hotel_model.dart';
import '../../domain/repositories/hotel_repository.dart';

class HotelRepositoryImpl implements HotelRepository {
  final SupabaseClient _supabase;

  HotelRepositoryImpl({required SupabaseClient supabase})
    : _supabase = supabase;

  @override
  Future<List<HotelModel>> getHotels({
    double? minPrice,
    double? maxPrice,
    double? minRating,
    List<String>? amenities,
  }) async {
    try {
      var query = _supabase.from('hotels').select();

      if (minPrice != null) {
        query = query.gte('base_price', minPrice);
      }

      if (maxPrice != null) {
        query = query.lte('base_price', maxPrice);
      }

      if (minRating != null) {
        query = query.gte('rating', minRating);
      }

      final response = await query;
      return response.map((json) => HotelModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch hotels: ${e.toString()}');
    }
  }

  @override
  Future<HotelModel> getHotelById(String id) async {
    try {
      final response =
          await _supabase.from('hotels').select().eq('id', id).single();
      return HotelModel.fromJson(response);
    } catch (e) {
      throw Exception('Failed to fetch hotel: ${e.toString()}');
    }
  }
}
