import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/repositories/hotel_repository.dart';
import '../../domain/models/hotel_model.dart';

// Events
abstract class HotelEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchHotelsEvent extends HotelEvent {
  // Remove searchQuery parameter
  final double? minPrice;
  final double? maxPrice;
  final double? minRating;
  final List<String>? amenities;

  FetchHotelsEvent({
    // Remove searchQuery parameter
    this.minPrice,
    this.maxPrice,
    this.minRating,
    this.amenities,
  });

  @override
  List<Object?> get props => [minPrice, maxPrice, minRating, amenities];
}

// States
abstract class HotelState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HotelInitial extends HotelState {}

class HotelLoading extends HotelState {}

class HotelLoaded extends HotelState {
  final List<HotelModel> hotels;

  HotelLoaded(this.hotels);

  @override
  List<Object?> get props => [hotels];
}

class HotelError extends HotelState {
  final String message;

  HotelError(this.message);

  @override
  List<Object?> get props => [message];
}

// Bloc
class HotelBloc extends Bloc<HotelEvent, HotelState> {
  final HotelRepository _hotelRepository;

  HotelBloc({required HotelRepository hotelRepository})
    : _hotelRepository = hotelRepository,
      super(HotelInitial()) {
    on<FetchHotelsEvent>(_onFetchHotels);
  }

  Future<void> _onFetchHotels(
    FetchHotelsEvent event,
    Emitter<HotelState> emit,
  ) async {
    emit(HotelLoading());
    try {
      final hotels = await _hotelRepository.getHotels(
        // Remove searchQuery parameter
        minPrice: event.minPrice,
        maxPrice: event.maxPrice,
        minRating: event.minRating,
        amenities: event.amenities,
      );
      emit(HotelLoaded(hotels));
    } catch (e) {
      emit(HotelError(e.toString()));
    }
  }
}
