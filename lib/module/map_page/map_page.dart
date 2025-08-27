import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_coffee_app/module/map_page/cubit/map_cubit.dart';
import 'package:flutter_coffee_app/module/map_page/cubit/map_state.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

// lat: 10.7712845,
//       lng: 106.6748306,

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MapCubit()
        ..addStoreMarker(const LatLng(10.7712845, 106.6748306))
        ..addStoreMarker(const LatLng(21.0060, 105.8220))
        ..loadCurrentLocation(),
      child: BlocBuilder<MapCubit, MapState>(
        builder: (context, state) {
          if (state.loading || state.center == null) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
          return Scaffold(
            appBar: AppBar(title: const Text("Cửa Hàng")),
            body: Stack(
              children: [
                FlutterMap(
                  options: MapOptions(
                    initialCenter: state.center!,
                    initialZoom: 15,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    ),
                    MarkerLayer(markers: state.markers),
                  ],
                ),

                // Ô tìm kiếm
                Positioned(
                  top: 10,
                  left: 10,
                  right: 10,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Tìm kiếm",
                            prefixIcon: const Icon(Icons.search),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.list),
                          onPressed: () {
                            // mở danh sách cửa hàng
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                // Nút "My Location"
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: FloatingActionButton(
                    onPressed: () =>
                        context.read<MapCubit>().loadCurrentLocation(),
                    child: const Icon(Icons.my_location),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
