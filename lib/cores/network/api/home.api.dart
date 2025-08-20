import 'package:dio/dio.dart';

import 'package:flutter_coffee_app/model/remote/resource/home_response.dart';
import 'package:retrofit/retrofit.dart';

part 'home.api.g.dart';

@RestApi()
abstract class HomeAPI {
  factory HomeAPI(Dio dio) = _HomeAPI;
  @GET("/system-service/api/banner/list")
  Future<HomeResponse> getBannerList({
    @Query("cursor") String? cursor,
    @Query("limit") int? limit,
    @Query("type") int? type,
  });
}
