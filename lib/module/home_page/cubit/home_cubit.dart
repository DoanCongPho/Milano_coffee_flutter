import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_coffee_app/cores/pref/pref_key.dart';
import 'package:flutter_coffee_app/cores/repositories/banner_repository.dart';
import 'package:flutter_coffee_app/model/remote/resource/home_response.dart';
import 'package:flutter_coffee_app/module/home_page/cubit/home_state.dart';

import 'package:shared_preferences/shared_preferences.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository _homeRepository;
  int _typeIndex = 1;
  List<BannerItem> _allBanners = [];
  String _name = 'Người dùng';

  HomeCubit(this._homeRepository) : super(HomeInitial());

  Future<void> loadUserData() async {
    emit(HomeInitial());
    final prefs = await SharedPreferences.getInstance();
    final _name = prefs.getString(PrefKey.fullName) ?? 'Người dùng';

    emit(HomeLoaded(name: _name, banners: _allBanners, typeIndex: _typeIndex));
  }

  Future<void> loadBanner() async {
    if (_typeIndex == 3) {
      emit(
        HomeLoaded(name: _name, banners: _allBanners, typeIndex: _typeIndex),
      );
    } else {
      try {
        final banners = await _homeRepository.fetchBanners(
          cursor: '',
          type: _typeIndex,
          limit: 10,
        );
        _allBanners = [..._allBanners, ...banners.data];
        emit(
          HomeLoaded(name: _name, banners: _allBanners, typeIndex: _typeIndex),
        );
        _typeIndex += 1;
      } catch (e) {
        emit(HomeError(error: 'Failed to load banners: $e'));
      }
    }
  }
}

class CarouselCubit extends Cubit<int> {
  CarouselCubit() : super(0); // Bắt đầu với ảnh đầu tiên

  void updateIndex(int index) => emit(index);
}
