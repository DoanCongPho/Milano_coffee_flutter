import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_coffee_app/cores/locator/locator.dart';
import 'package:flutter_coffee_app/cores/pref/store_service.dart';
import 'package:flutter_coffee_app/cores/repositories/home_repository.dart';
import 'package:flutter_coffee_app/model/remote/resource/home_response.dart';
import 'package:flutter_coffee_app/module/home_page/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository _homeRepository;
  int _typeIndex = 1;
  List<BannerItem> _allBanners = [];
  List<ProductItem> _allProducts = [];
  List<Store> _allStore = [];
  String _cursorProduct = '';
  String _cursorStore = '';
  String _name = 'Người dùng';
  String _nearestStoreID = '';
  bool _initialized = false;
  HomeCubit(this._homeRepository) : super(HomeInitial());

  Future<void> initAPI() async {
    if (_initialized) return; // <-- prevent running twice
    _initialized = true;

    await loadUserData();
    await loadStore();
    await updateNearestStoreID();
    await loadProduct();
  }

  Future<void> loadUserData() async {
    final pref = sl.get<StoreService>();
    _name = await pref.getName() ?? 'Nguoi dung';
    emit(
      HomeLoaded(
        name: _name,
        banners: _allBanners,
        products: _allProducts,
        typeIndex: _typeIndex,
        cursorProduct: _cursorProduct,
        cursorStore: _cursorStore,
        stores: _allStore,
        nearestStoreID: _nearestStoreID,
      ),
    );
  }

  Future<void> updateNearestStoreID() async {
    if (_allStore.isEmpty) {
      return;
    }
    _nearestStoreID = _allStore[0].id;
    emit(
      HomeLoaded(
        name: _name,
        banners: _allBanners,
        typeIndex: _typeIndex,
        products: _allProducts,
        cursorProduct: _cursorProduct,
        cursorStore: _cursorStore,
        stores: _allStore,
        nearestStoreID: _nearestStoreID,
      ),
    );
  }

  Future<void> loadProduct() async {
    try {
      final products = await _homeRepository.fetchProducts(
        cursor: _cursorProduct,
        store: _nearestStoreID,
        limit: 6,
      );
      _allProducts = [..._allProducts, ...products.data];
      _cursorProduct = products.cursor;
      emit(
        HomeLoaded(
          name: _name,
          banners: _allBanners,
          typeIndex: _typeIndex,
          products: _allProducts,
          cursorProduct: _cursorProduct,
          cursorStore: _cursorStore,
          stores: _allStore,
          nearestStoreID: _nearestStoreID,
        ),
      );
    } catch (e) {
      emit(HomeError(error: 'Failed to load Products: $e'));
    }
  }

  Future<void> loadStore() async {
    try {
      final stores = await _homeRepository.fetchStores(
        cursor: _cursorStore,
        limit: 6,
        lat: 10.7712845,
        lng: 106.6748306,
      );
      _cursorStore = stores.cursor;
      _allStore = [..._allStore, ...stores.data];
      emit(
        HomeLoaded(
          name: _name,
          banners: _allBanners,
          typeIndex: _typeIndex,
          products: _allProducts,
          cursorProduct: _cursorProduct,
          cursorStore: _cursorStore,
          stores: _allStore,
          nearestStoreID: _nearestStoreID,
        ),
      );
    } catch (e) {
      emit(HomeError(error: 'Failed to load banners: $e'));
    }
  }

  Future<void> loadBanner() async {
    if (_typeIndex == 3) {
      emit(
        HomeLoaded(
          name: _name,
          banners: _allBanners,
          typeIndex: _typeIndex,
          products: _allProducts,
          cursorProduct: _cursorProduct,
          cursorStore: _cursorStore,
          stores: _allStore,
          nearestStoreID: _nearestStoreID,
        ),
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
          HomeLoaded(
            name: _name,
            banners: _allBanners,
            typeIndex: _typeIndex,
            products: _allProducts,
            cursorProduct: _cursorProduct,
            cursorStore: _cursorStore,
            stores: _allStore,
            nearestStoreID: _nearestStoreID,
          ),
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
