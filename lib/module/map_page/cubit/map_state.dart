import 'package:equatable/equatable.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapState extends Equatable {
  final LatLng? center;
  final List<Marker> markers;
  final bool loading;
  final String? error;

  const MapState({
    this.center,
    this.markers = const [],
    this.loading = false,
    this.error,
  });

  MapState copyWith({
    LatLng? center,
    List<Marker>? markers,
    bool? loading,
    String? error,
  }) {
    return MapState(
      center: center ?? this.center,
      markers: markers ?? this.markers,
      loading: loading ?? this.loading,
      error: error,
    );
  }

  @override
  List<Object?> get props => [center, markers, loading, error];
}
