import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_coffee_app/model/remote/resource/home_response.dart';
import 'package:flutter_coffee_app/module/home_page/cubit/home_cubit.dart';
import 'package:flutter_coffee_app/module/home_page/cubit/home_state.dart';
import 'package:flutter_coffee_app/module/map_page/cubit/map_cubit.dart';
import 'package:flutter_coffee_app/module/map_page/cubit/map_state.dart';
import 'package:flutter_map/flutter_map.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});
  @override
  Widget build(BuildContext context) {
    final stores = context.select<HomeCubit, List<Store>>((cubit) {
      final state = cubit.state;
      return state is HomeLoaded ? state.stores : <Store>[];
    });
    return BlocProvider(
      create: (_) => MapCubit()
        ..loadCurrentMaker(stores)
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
                          onPressed: () {},
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
