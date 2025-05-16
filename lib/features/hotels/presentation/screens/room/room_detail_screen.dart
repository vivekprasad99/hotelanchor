import 'package:flutter/material.dart';
import 'package:hotelanchor/features/hotels/presentation/screens/room/room_mobile_view.dart';

class RoomDetailScreen extends StatelessWidget {
  final String roomType;

  const RoomDetailScreen({Key? key, required this.roomType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${roomType.toUpperCase()} ROOM'),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF0A1931),
        elevation: 0,
      ),
      body: RoomMobileView(roomType: roomType),
    );
  }
}
