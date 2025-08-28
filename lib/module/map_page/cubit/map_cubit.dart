import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_coffee_app/model/remote/resource/home_response.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
import 'map_state.dart';
import 'package:flutter/material.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit() : super(const MapState());

  Future<void> loadCurrentMaker(List<Store> stores) async {
    final initMarkers = stores.map((store) {
      return Marker(
        point: LatLng(store.lat, store.lng),
        width: 40,
        height: 40,
        child: const Icon(Icons.location_on, color: Colors.red, size: 40),
      );
    }).toList();

    final updatedMarkers = [...state.markers, ...initMarkers];

    emit(state.copyWith(markers: updatedMarkers));
  }

  Future<void> loadCurrentLocation() async {
    emit(state.copyWith(loading: true, error: null));
    try {
      // check service
      final serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        emit(state.copyWith(loading: false, error: "Location disabled"));
        return;
      }

      // check permission
      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          emit(state.copyWith(loading: false, error: "Permission denied"));
          return;
        }
      }
      if (permission == LocationPermission.deniedForever) {
        emit(
          state.copyWith(
            loading: false,
            error: "Permission permanently denied",
          ),
        );
        return;
      }

      // get current position
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      final pos = LatLng(position.latitude, position.longitude);
      // final pos = LatLng(10.7512845, 106.665582);

      // markers: giữ markers cũ + thêm marker user
      final updatedMarkers = [
        ...state.markers,
        Marker(
          point: pos,
          width: 40,
          height: 40,
          child: const Icon(Icons.my_location, color: Colors.blue, size: 40),
        ),
      ];

      emit(
        state.copyWith(center: pos, markers: updatedMarkers, loading: false),
      );
    } catch (e) {
      emit(state.copyWith(loading: false, error: e.toString()));
    }
  }
}
